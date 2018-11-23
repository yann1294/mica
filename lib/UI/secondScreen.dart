import 'package:flutter/material.dart';

class secondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new secondScreenState();
  }



}

class secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "MICA"
        ),
      ),
    );
  }
}