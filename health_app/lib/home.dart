import 'package:flutter/material.dart';
import 'package:health_app/BMI.dart';
import 'package:health_app/BMR.dart';

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
        title:const Text('Health App'),
      ),
      body:Container(
        child:ListView(
          children: <Widget>[
            ListTile(
              leading:const Icon(Icons.health_and_safety_rounded, color:Colors.green),
              title:const Text(
                'BMI CALCULATOR',
                style:TextStyle(fontSize:20,fontStyle: FontStyle.italic)
              ),
              subtitle: const Text('Body Mass Index'),
              trailing:const Icon(Icons.keyboard_arrow_right),
              onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> BMIpage()));
              },
            ),
             ListTile(
              leading:const Icon(Icons.health_and_safety_rounded, color:Colors.green),
              title:const Text(
                'BMR CALCULATOR',
                style:TextStyle(fontSize:20,fontStyle: FontStyle.italic)
              ),
              subtitle: const  Text('Basal Metabolic Rate'),
              trailing:const Icon(Icons.keyboard_arrow_right),
              onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>const BMRpage()));
              },
            )
          ],
        )
      )
    );
  }

  
}








