// ignore_for_file: file_names
import 'package:hive_flutter/hive_flutter.dart';
import 'package:health_app/boxes.dart';
import 'package:health_app/loginData.dart';
import 'package:flutter/material.dart';
import 'package:health_app/home.dart';
import 'package:hive/hive.dart';
 
void main() {
  runApp( loginPage(),
  );
}
 
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}
 
class _loginPageState extends State<loginPage> {
  //TextEditingController nameController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  
  // To delete a box
  // @override
  // void dispose(){
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.green,
          title:const  Text('Health App'),
        ),
        body:
         Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                ValueListenableBuilder<Box<LoginData>>(
          valueListenable:Boxes.getData().listenable(),
          builder:(context,box,_) {
            final data=box.values.toList().cast<LoginData>();
            return buildContent(data);
          },
        ), 
                Padding(
                  padding:const EdgeInsets.only(top:15.0),
                  child:Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child:const  Text(
                      'Details',
                      style: TextStyle(fontSize: 20),
                    )),
                ),
                 
                Container(
                  padding:const  EdgeInsets.all(10),
                  child: TextField(
                    //controller: nameController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    //controller: passwordController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'age',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    //controller: passwordController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'height',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    //controller: passwordController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'weight',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    side: const BorderSide(width:1, color:Colors.black), 
                    elevation: 5, 
                  ),
                      child:const  Text('Submit'),
                      onPressed: () {
                       // print(nameController.text);
                        //print(passwordController.text);
                      },
                    )),  
              ],
            )))
    );
  }
} 

Future addData (String username , int age , double height , double weight )
async {
  final data = LoginData()
  ..username=username
  ..age=age
  ..height=height
  ..weight=weight;
  
  //setState(() => Data.add(data));
  final box = Boxes.getData(); 
  box.add(data);
  final mybox = Boxes.getData;
  mybox.values;

}

