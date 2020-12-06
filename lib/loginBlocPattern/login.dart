import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_network/loginBlocPattern/loginbloc/LoginBloc.dart';

class LoginPage extends StatelessWidget {
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Bloc login example"),
        centerTitle: true,
      ),
      body: buildLoginWidgets(),
    );
  }

  gotoHome(BuildContext context) {
   print("successful");
  }

  buildLoginWidgets() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<String>(
              stream: loginBloc.email,
              builder: (context, snapshot) => TextField(
                onChanged: loginBloc.onEmailChanged,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    errorText: snapshot.error,
                    hintText: "Enter your email",
                    labelText: "Email"),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            StreamBuilder<String>(
              stream: loginBloc.password,
              builder: (context, snapshot) => TextField(
                onChanged: loginBloc.onPasswordChanged,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    errorText: snapshot.error,
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                    labelText: "Password"),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            StreamBuilder<bool>(
                stream: loginBloc.checkResults,
                builder: (context, snapshot) => RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: (snapshot.hasData)
                        ? ()=> gotoHome(context)
                        : invalid(),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }

  invalid() {
    print("invalid");
  }
}
