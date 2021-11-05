import 'package:authentication/model/user.dart';
import 'package:authentication/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController(); 
    final authService = Provider.of<AuthService>(context);
     
    return Scaffold(
      appBar: AppBar(title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          )),
          ElevatedButton(
            child: Text('Login'),
            onPressed: (){
              authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
            },),
          SizedBox(height: 10,),
          ElevatedButton(child: Text('Register'),
          onPressed: (){
            Navigator.pushNamed(context, '/register');
          },)
        ],
      )

    );
  }
}