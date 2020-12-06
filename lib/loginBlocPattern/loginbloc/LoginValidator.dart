import 'dart:async';

mixin LoginValidator {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if(email.contains("@")){
          sink.add(email);
        }else{
          sink.addError("Invalid email");
        }
      });

  var passwordValidator = StreamTransformer<String , String>.fromHandlers(
    handleData: (password,sink){
      //todo check characters using regExp
      if(password.length > 6 ){
        sink.add(password);
      }else{
        sink.addError("password too short");
      }

    }
  );
}
