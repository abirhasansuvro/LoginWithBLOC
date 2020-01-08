
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          generateEmail(),
          generatePassword(),
          Container(margin: EdgeInsets.only(top:25),),
          generateButton('Submit'),
        ],
      ),
    );
  }

  Widget generateEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'yourname@example.com',
        labelText: 'Email',
      ),
    );
  }

  Widget generatePassword(){
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Jergy@13',
        labelText: 'Password',
      ),
    );
  }

  Widget generateButton(String str){
    return RaisedButton(
      onPressed: (){},
      child: Text(str),
      color: Colors.blue,
    );
  }

}