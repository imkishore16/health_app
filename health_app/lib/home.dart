import 'package:flutter/material.dart';
import 'package:health_app/splash.dart';
import 'package:health_app/main.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }  
}

class MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar:AppBar(
        title:Text('Health App'),
      ),
      body:Container(
        child:ListView(
          children: <Widget>[
            ListTile(
              leading:Icon(Icons.health_and_safety_rounded),
              title:Text(
                'BMI CALCULATOR',
                style:TextStyle(fontSize:20,fontStyle: FontStyle.italic)
              ),
              onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>BMIpage()));
              },
            ),
            ListTile(
              leading:CircleAvatar(
                radius:20,
                backgroundImage:AssetImage('images/avatar.jpg'),
              ),
              title:Text(
                'CALORIE COUNTER',
                style:TextStyle(fontSize:20,fontStyle: FontStyle.italic)
              ),
              trailing:Icon(Icons.keyboard_arrow_right),
            )
          ],
        )
      )
    );
  }

  
}


// BMI CALCULATOR ON-PRESSED
class BMIpage extends StatefulWidget {
  const BMIpage({ Key? key }) : super(key: key);
  @override
  _BMIpageState createState() => _BMIpageState();
}

class _BMIpageState extends State<BMIpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:ListView(
        children:<Widget>[
         Padding(
            padding:(EdgeInsets.only(top:2.0,bottom:2.0)),
            child: TextField(
              keyboardType:TextInputType.number,
              decoration:InputDecoration(
                border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'Principal',
                hintText:'enter principal amount'
              
              ))),
        ],
      )
    );
  }
}