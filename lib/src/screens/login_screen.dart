
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LogInScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          generateEmail(bloc),
          generatePassword(bloc),
          Container(margin: EdgeInsets.only(top:25),),
          generateButton('Submit',bloc),
        ],
      ),
    );
  }

  Widget generateEmail(Bloc bloc){
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context,snapshot){
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'yourname@example.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: bloc.addEmail,
          );
      },
    );
    
  }

  Widget generatePassword(Bloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context,snapshot){
          return TextField(
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Jergy@13',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            onChanged: bloc.addPassword,
          );
      },
    );
  }

  Widget generateButton(String str,Bloc bloc){
    return StreamBuilder(
      stream: bloc.buttonValid,
      builder: (context,snapshot){
        return RaisedButton(
          onPressed: snapshot.hasData ?bloc.submit:null,
          child: Text(str),
          color: Colors.blue,
        );
      },
    );
  }

}