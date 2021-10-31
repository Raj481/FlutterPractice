import 'package:flutter/material.dart';
import '../constants/route_paths.dart' as routes ;
import '../viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
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
              "Login",
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
                  var success = await model.login(success: true);
                  if (success) {
                    Navigator.of(context).pushNamed(routes.HomeRoute);
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
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      alignment: Alignment.center,
                      child: !model.busy
                          ? const Text('Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 30))
                          : const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.shade200,
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
      ) ,
    );
  }
}
