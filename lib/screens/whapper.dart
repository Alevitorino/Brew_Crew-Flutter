import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Whapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }else {
      return Home();
    }
  }
}