import 'package:flutter/material.dart';
import 'package:mica/UI/secondScreen.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homePageState();
  }

}

class homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new InkWell(
              child:
            new Image.asset('Images/Tree.png',height: 200.0, width: 500.0),
            //onTap: ()=>debugPrint("it's working"),
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context)=> new secondScreen()));
              },
            ),
            new Text(
              "MICA",

              style: new TextStyle(

                color: Colors.black45,
                wordSpacing: 10.5,
                fontSize: 45.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontFamily: 'Georgia'
              ),

            ),
            new Text(
              "Make India Clean Again",
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Georgia",
                fontSize: 15.0,
                wordSpacing: 2.5
              ),
            )
          ],
        ),
    );
  }
}