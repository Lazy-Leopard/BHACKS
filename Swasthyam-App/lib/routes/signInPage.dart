import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class SignInPage extends StatelessWidget {
  String email, password;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Sign In to Swasthyam',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (value){
                email = value;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email_rounded , color: Color(0xff00ace0)),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  borderSide: BorderSide(width: 1 , color: Color(0xff00ace0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0 , color: Color(0xff00b4e0)),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0 , color: Color(0xff0086e0)),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
              ),
            ),
            TextField(
              onChanged: (value){
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key_rounded , color: Color(0xff00ace0)),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  borderSide: BorderSide(width: 1 , color: Color(0xff00ace0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0 , color: Color(0xff00b4e0)),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0 , color: Color(0xff0086e0)),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
              ),
            ),
            RaisedButton(
                onPressed: () async {
                  try {
                    UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
                    if (user != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  } catch (e){
                    print(e);
                  }
                },
                child: Text('Sign In'),
            ),
            GestureDetector(
              child: Text(
                'New to Swasthyam? Sign Up here!',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
