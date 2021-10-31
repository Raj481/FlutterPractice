import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripePyamentExample extends StatefulWidget {
  const StripePyamentExample({Key? key}) : super(key: key);

  @override
  _StripePyamentExampleState createState() => _StripePyamentExampleState();
}

class _StripePyamentExampleState extends State<StripePyamentExample> {

  Token? _paymentToken;
  PaymentMethod? _paymentMethod;
  String? _error;

  //this client secret is typically created by a backend system
  //check https://stripe.com/docs/payments/payment-intents#passing-to-client
  final String? _paymentIntentClientSecret = null;

  PaymentIntentResult? _paymentIntent;
  Source? _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 23,
    name: 'Test User',
    cvc: '133',
    addressLine1: 'Address 1',
    addressLine2: 'Address 2',
    addressCity: 'City',
    addressState: 'CA',
    addressZip: '1337',
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey: "pk_test_9tbJlkWMB410NyuloOVhAmSKSdoivgUytg9lb900TNNd1QxE",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppbar(),
      body: ListView(
        controller: _controller,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          MaterialButton(
            child: Text("Create Source"),
            onPressed: () {
              StripePayment.createSourceWithParams(SourceParams(
                type: 'ideal',
                amount: 1099,
                currency: 'eur',
                returnURL: 'example://stripe-redirect',
              )).then((source) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${source.sourceId}')));
                    setState(() {
                      _source = source;
                    });
              }).catchError(setError);
            },
          ),
          Divider(),
          MaterialButton(
            child: Text("Create Token with Card Form"),
            onPressed: () {
              StripePayment.paymentRequestWithCardForm(
                  CardFormPaymentRequest())
                  .then((paymentMethod) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          MaterialButton(
            child: Text("Create Token with Card"),
            onPressed: () {
              StripePayment.createTokenWithCard(
                testCard,
              ).then((token) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${token.tokenId}')));
                setState(() {
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          MaterialButton(
            child: Text("Create Payment Method with Card"),
            onPressed: () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: testCard,
                ),
              ).then((paymentMethod) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          MaterialButton(
            child: Text("Create Payment Method with existing token"),
            onPressed: _paymentToken == null
                ? null
                : () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: CreditCard(
                    token: _paymentToken!.tokenId,
                  ),
                ),
              ).then((paymentMethod) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          MaterialButton(
            child: Text("Confirm Payment Intent"),
            onPressed:
            _paymentMethod == null || _paymentIntentClientSecret == null
                ? null
                : () {
              StripePayment.confirmPaymentIntent(
                PaymentIntent(
                  clientSecret: _paymentIntentClientSecret,
                  paymentMethodId: _paymentMethod!.id,
                ),
              ).then((paymentIntent) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          MaterialButton(
            child: Text(
              "Confirm Payment Intent with saving payment method",
              textAlign: TextAlign.center,
            ),
            onPressed:
            _paymentMethod == null || _paymentIntentClientSecret == null
                ? null
                : () {
              StripePayment.confirmPaymentIntent(
                PaymentIntent(
                  clientSecret: _paymentIntentClientSecret,
                  paymentMethodId: _paymentMethod!.id!,
                  isSavingPaymentMethod: true,
                ),
              ).then((paymentIntent) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          MaterialButton(
            child: Text("Authenticate Payment Intent"),
            onPressed: _paymentIntentClientSecret == null
                ? null
                : () {
              StripePayment.authenticatePaymentIntent(
                  clientSecret: _paymentIntentClientSecret!)
                  .then((paymentIntent) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          MaterialButton(
            child: Text("Native payment"),
            onPressed: () {
              if (Platform.isIOS) {
                _controller.jumpTo(450);
              }
              StripePayment.paymentRequestWithNativePay(
                androidPayOptions: AndroidPayPaymentRequest(
                  totalPrice: "1.20",
                  currencyCode: "EUR",
                ),
                applePayOptions: ApplePayPaymentOptions(
                  countryCode: 'DE',
                  currencyCode: 'EUR',
                  items: [
                    ApplePayItem(
                      label: 'Test',
                      amount: '13',
                    )
                  ],
                ),
              ).then((token) {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Received ${token.tokenId}')));
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          MaterialButton(
            child: Text("Complete Native Payment"),
            onPressed: () {
              StripePayment.completeNativePayRequest().then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Completed successfully')));
              }).catchError(setError);
            },
          ),
          Divider(),
          Text('Current source:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current token:'),
          Text(
            JsonEncoder.withIndent('  ')
                .convert(_paymentToken?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment method:'),
          Text(
            JsonEncoder.withIndent('  ')
                .convert(_paymentMethod?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment intent:'),
          Text(
            JsonEncoder.withIndent('  ')
                .convert(_paymentIntent?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current error: $_error'),
        ],
      ),
    );
  }

  AppBar getAppbar(){
    return AppBar(
      backgroundColor: const Color(0XFFe5fbff),
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff113a83),
        ),
        onPressed: (){
          Get.back();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _source = null;
              _paymentIntent = null;
              _paymentMethod = null;
              _paymentToken = null;
            });
          },
        )
      ],
      centerTitle: true,
      title: const Text(
        "Stripe Example App",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

}
