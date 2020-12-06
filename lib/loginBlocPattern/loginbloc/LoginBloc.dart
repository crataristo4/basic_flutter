import 'dart:async';

import 'package:flutter_network/loginBlocPattern/loginbloc/LoginValidator.dart';
import 'package:rxdart/rxdart.dart' as Observable;

abstract class BaseLoginBloc {
  void dispose();
}

class LoginBloc extends Object with LoginValidator implements BaseLoginBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //add data
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;


  //change data
  Function(String) get onEmailChanged => _emailController.sink.add;

  Function(String) get onPasswordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);

  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get checkResults =>
      Observable.Rx.combineLatest2(email, password, (e, p) => true);

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
