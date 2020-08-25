import 'package:chat/component/alert.dart';
import 'package:chat/component/textformfield.dart';
import 'package:chat/service/service_manager.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  String _value = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(child: formValidation()),
      ),
    );
  }

  Widget formValidation() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: EGTextFormField(
              hintText: 'user name',
              controller: _name,
              labelText: 'user name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: EGTextFormField(
              hintText: 'password',
              controller: _password,
              labelText: 'password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: EGTextFormField(
              hintText: 'email',
              controller: _email,
              labelText: 'email',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: dropDownMenu(),
          ),
          validationButton(text: "Sign up")
        ],
      ),
    );
  }

  Widget validationButton({String text}) {
    return RaisedButton(
      color: Colors.indigo,
        child: Text(text,style: TextStyle(color: Colors.white),),
        onPressed: () {
          var data = <String, dynamic>{
            "name": _name.text,
            "password": _password.text,
            "email": _email.text,
            "sex": _value,
            "about": "Hi There"
          };
          print(data);
          ServiceManager.shared.signUp(data,completionHandler : (message) {
            showDialog(context: context,builder: (context) => EGAlert(title: "Message", bodyMessage: message));
            [_name,_password,_email].forEach((element) {element.clear();});
          });
        });
  }

  Widget dropDownMenu() {
    return InputDecorator(
      decoration: const InputDecoration(contentPadding:const EdgeInsets.only(bottom: 10, right: 20, left: 10),border: const OutlineInputBorder()),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: _value,
            hint: Text('Sex'),
            items: [
              DropdownMenuItem(value: "male", child: Text('male')),
              DropdownMenuItem(value: "female", child: Text('female')),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }),
      ),
    );
  }
}
