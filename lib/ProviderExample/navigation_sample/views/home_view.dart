import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderExample/navigation_sample/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFFe5fbff),
            elevation: 0.5,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff113a83),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(
              "Home",
              style: TextStyle(
                  color: Color(0xff113a83),
                  fontSize: 18
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () async {
                  var success = await model.logout();
                  if (success) {
                    Navigator.of(context).pop();
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    model.hasErrorMessage
                        ? Text(
                            model.errorMessage,
                            style: TextStyle(
                              color: Colors.red[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        : Container(),
                    Container(
                      width: 200,
                      height: 80,
                      alignment: Alignment.center,
                      child: !model.busy
                          ? Text('Logout',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 30))
                          : CircularProgressIndicator(),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade200,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
