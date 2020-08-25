import 'package:chat/component/alert.dart';
import 'package:chat/component/textformfield.dart';
import 'package:chat/service/service_manager.dart';
import 'package:chat/views/shuffle/shuffle.dart';
import 'package:chat/views/signup/signup.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignIn'),),
      body:SingleChildScrollView(child: formValidation(context),),
    );
  }

  Widget formValidation(BuildContext context){
    return Form(
      child: Column(
        children: [
          Image.network("https://miro.medium.com/max/700/0*ju0VsS5wflu0X_Y4.jpg"),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: EGTextFormField(controller: _email,hintText: 'email',labelText: 'email',obscureText: false,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: EGTextFormField(controller: _password,hintText: 'password',labelText: 'password',obscureText: true,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            RaisedButton(
            color: Colors.redAccent,
            child: Text('Sign In',style: TextStyle(color: Colors.white),),
            onPressed: (){
              //User Data For Service
              var userData = <String,dynamic>{
                "email": _email.text,
                "password" : _password.text
              };
              print(userData);
              ServiceManager.shared.signIn(userData,completionHandler: (status,message){
                if(status){
                  Navigator.of(context).pushAndRemoveUntil((MaterialPageRoute(builder: (context)=> ShuffleView())), (route) => false);
                }else{
                  showDialog(context: context,builder: (context)=> EGAlert(title: 'Error',bodyMessage: message,));
                }
              });

            }),
            RaisedButton(
            color: Colors.green,
            child: Text('Sign Up',style: TextStyle(color: Colors.white),),
            onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpView()));
              })
              
          ],)
        ],
      ),
    );
  }
}