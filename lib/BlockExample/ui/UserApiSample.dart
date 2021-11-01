import 'package:flutter/material.dart';
import 'package:flutter_practice/BlockExample/bloc/blocs/UserBLoC.dart';
import 'package:flutter_practice/BlockExample/models/User.dart';
import 'package:flutter_practice/BlockExample/ui/UserDetailScreen.dart';
import 'package:get/get.dart';

class UserApiSample extends StatefulWidget {
  const UserApiSample({Key? key}) : super(key: key);

  @override
  _UserApiSampleState createState() => _UserApiSampleState();
}

class _UserApiSampleState extends State<UserApiSample> {

  UserBLoC userBLoC = new UserBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: StreamBuilder(
          stream: userBLoC.usersList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text('There was an error : ${snapshot.error}');
                List<User>? users = snapshot.data as List<User>;

                return ListView.separated(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    User _user = users[index];
                    return ListTile(
                      title: Text(_user.name.toString()),
                      subtitle: Text(_user.email.toString()),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.person
                        ),
                      ),
                      onTap: (){
                        Get.to(UserDetailScreen(user: _user,));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
            }
          }),
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
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Users Api Sample",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
      /* actions: [
        IconButton(
          icon: const Icon(
            Icons.file_copy_sharp,
            color: Color(0xff113a83),
          ),
          onPressed: (){

          },
        )
      ],*/
    );
  }

}
