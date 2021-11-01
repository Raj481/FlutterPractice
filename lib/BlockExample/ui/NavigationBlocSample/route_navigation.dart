import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class RouteNavigationHome extends StatelessWidget {
  const RouteNavigationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBloc(),
      child: MyApp(),
    );
  }
}



@immutable
abstract class MyEvent {}

class EventA extends MyEvent {}

class EventB extends MyEvent {}

@immutable
abstract class MyState {}

class StateA extends MyState {}

class StateB extends MyState {}

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(StateA()) {
    on<EventA>((event, emit) => emit(StateA()));
    on<EventB>((event, emit) => emit(StateB()));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => PageA(),
        '/pageB': (context) => PageB(),
      },
      initialRoute: '/',
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBloc, MyState>(
      listener: (context, state) {
        if (state is StateB) {
          Navigator.of(context).pushNamed('/pageB');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFFe5fbff),
          title: Text(
              'Page A',
              style: TextStyle(
                  color: Color(0xff113a83),
                  fontSize: 18
              )
          ),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Go to PageB'),
            onPressed: () {
              context.read<MyBloc>().add(EventB());
            },
          ),
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff113a83),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0XFFe5fbff),
        title: Text(
            'Page B',
            style: TextStyle(
                color: Color(0xff113a83),
                fontSize: 18
            )
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pop'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}