import 'package:brew_crew/screens/home/setting_form.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:provider/provider.dart';

import 'package:brew_crew/models/brew.dart';

import 'brew_list.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('lougout'),
              onPressed: () async {
                await _auth.SignOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
              
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}