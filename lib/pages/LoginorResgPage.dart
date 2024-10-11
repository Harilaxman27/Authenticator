import 'package:authentication/pages/ResgisterPage.dart';
import 'package:authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
class LoginorResgPage extends StatefulWidget {
  const LoginorResgPage({super.key});

  @override
  State<LoginorResgPage> createState() => _LoginorResgPageState();
}

class _LoginorResgPageState extends State<LoginorResgPage> {
  bool showLoginPage = true;
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return Resgisterpage(
        onTap: togglePages,
      );
    }
  }
}
