import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mica/UI/secondScreen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homePageState();
  }
}

class homePageState extends State<homePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print("UserName: ${user.displayName}");
      return user;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset(
            "Images/Tree.png",
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "MICA",
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 8.0),
                        ),
                      ),
                      Text(
                        "MAKE IT CLEAN AGAIN",
                        style: TextStyle(
                            color: Colors.black26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () => _signIn()
                              .then((FirebaseUser user) => print(user))
                              .catchError((e) => print(e)),
                        ),
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () => {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
