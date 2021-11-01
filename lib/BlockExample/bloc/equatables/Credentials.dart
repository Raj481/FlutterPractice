
import 'package:equatable/equatable.dart';

class Credentials extends Equatable {

  Credentials({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];

  @override
  bool get stringify => false;
  
}