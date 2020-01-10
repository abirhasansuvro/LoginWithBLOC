import 'dart:async';
import 'package:rxdart/rxdart.dart';

import './validators.dart';

class Bloc with Validators{
  //final _emailStream=StreamController<String>.broadcast();
  //final _passwordStream=StreamController<String>.broadcast();

  final _emailStream=BehaviorSubject<String>();
  final _passwordStream=BehaviorSubject<String>();

  Function(String) get addEmail=>_emailStream.sink.add;
  Function(String) get addPassword=>_passwordStream.sink.add;

  Stream<String> get emailStream=>_emailStream.stream.transform(emailTransformer);
  Stream<String> get passwordStream=>_passwordStream.stream.transform(passwordTransformer);
  Stream<bool> get buttonValid=>Observable.combineLatest2(emailStream, passwordStream, (e,p)=>true);

  submit(){
    String latest_p=_passwordStream.value;
    String latest_e=_emailStream.value;
    print('New Email : $latest_e');
    print('New Pass : $latest_p');
  }

  dispose(){
    _emailStream.close();
    _passwordStream.close();
  }
}
//global approach
//final bloc=Bloc();