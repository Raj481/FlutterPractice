import 'package:flutter/material.dart';
import 'router.dart' as routers;
import 'constants/route_paths.dart' as routes ;

class NavigationSample extends StatelessWidget {

  NavigationSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.grey[800]
      ),
      onGenerateRoute: routers.generateRoute,
      initialRoute: routes.LoginRoute,
    );
  }
}