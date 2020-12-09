import 'package:flutter/material.dart';
import 'package:swasthyam/routes/diseaseInput.dart';
import 'package:swasthyam/routes/symptomsInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swasthyam/routes/testInput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Swasthyam'),
            leading: null,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Symptoms', icon: FaIcon(FontAwesomeIcons.heartbeat),),
                Tab(text: 'Tests', icon: FaIcon(FontAwesomeIcons.thermometerHalf)),
                Tab(text: 'Test Results', icon: FaIcon(FontAwesomeIcons.userMd)),
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    auth.signOut();
                    Navigator.pop(context);
                  }
              )
            ],
          ),
          body: TabBarView(
              children: [
                SymptomsInput(),
                DiseaseInput(),
                TestInput()
              ]
          ),
        )
      )
    );
  }
}
