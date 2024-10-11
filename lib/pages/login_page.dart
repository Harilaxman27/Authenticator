import 'package:authentication/components/mybuttons.dart';
import 'package:authentication/components/squaretile.dart';
import 'package:authentication/components/textfield.dart';
import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
   final Function()? onTap;
   const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }
  void wrongEmail(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        title: Text('Incorrect Email'),
      );
    },
    );
  }

  void wrongPassword(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        title: Text('Incorrect Passowrd'),
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                 const SizedBox(height: 50),
                 const Icon(
                  Icons.lock,
                  size: 100,
                ),
                 const SizedBox(height: 50),
                Text ('Welcome Back!!!',
                  style: TextStyle(color: Colors.grey[700],
                  fontSize: 16 ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Text("Forgot password?",
                style:TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Mybuttons(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness:0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Text("Or continue with "),
                    Expanded(
                      child: Divider(
                        thickness:0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Squaretile(
                        onTap: ()=>AuthServices().signInWithGoogle(),
                        imagePath: 'lib/images/Apple-Logo-500x281.png'),
                    SizedBox(width: 10),
                    Squaretile(
                        onTap:  ()=>AuthServices().signInWithGoogle(),
                        imagePath: 'lib/images/Google_Icons-09-512.webp'),
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register now',
                      style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
