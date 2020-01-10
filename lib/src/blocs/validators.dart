import 'dart:async';

class Validators{
  final emailTransformer=StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains('@'))sink.add(email);
      else sink.addError('Provide a valid email');
    }
  );

  final passwordTransformer=StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length<5)sink.addError('Password must be atleast length 5');
      else sink.add(password);
    }
  );

}