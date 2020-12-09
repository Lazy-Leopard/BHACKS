import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swasthyam/routes/homePage.dart';
import 'package:swasthyam/routes/signInPage.dart';

class SignUpPage extends StatelessWidget {
  String email, password, name, age, blood_group;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Sign Up for Swasthyam',
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
            TextField(
              onChanged: (value){
                name = value;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.person , color: Color(0xff00ace0)),
                hintText: "Name",
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
                age = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.money_rounded , color: Color(0xff00ace0)),
                hintText: "Age",
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
                blood_group = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: FaIcon(FontAwesomeIcons.syringe , color: Color(0xff00ace0)),
                hintText: "Blood Group",
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
                onPressed: (){
                  try {
                    if (email != null && password != null){
                      auth.createUserWithEmailAndPassword(email: email, password: password);
                      db.collection('patients').doc('$email').set({
                        'Name': '$name',
                        'Email': '$email',
                        'Age': '$age',
                        'Blood Group': '$blood_group'
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                    else {
                      print('Please fill email and password');
                    }
                  } catch (e){
                    print(e);
                  }
                },
                child: Text('Hello')
            ),
            GestureDetector(
              child: Text(
                'Already registered? Sign In here!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
