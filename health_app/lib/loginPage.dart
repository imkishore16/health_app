// ignore_for_file: file_names
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  // To delete a box
  // @override
  // void dispose(){
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const  Text('Health App'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.only(top:15.0),
                  child:Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child:const  Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                ),
                 
                Container(
                  padding:const  EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> MainScreen()));
                    //forgot password screen
                  },
                  //textStyle: Colors.blue,
                  child:const  Text('Forgot Password'),
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
                      child:const  Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text("Don't have account?"),
                      ElevatedButton(
                        //textColor: Colors.blue,
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

Future login(String username , String password )
{
  final data = LoginData()
  ..username=username
  ..password=password;
  
  setState(() => Data.add(data));

} 