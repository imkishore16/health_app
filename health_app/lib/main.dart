import 'dart:io'; 
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:health_app/loginData.dart';
//import 'package:health_app/loginData.g.dart';
import 'package:health_app/home.dart';
import 'package:health_app/splash.dart';
import 'package:health_app/loginPage.dart';
//import 'package:health_app/';

Future main() async {
  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(LoginDataAdapter());
  await Hive.openBox<LoginData>('data');

  runApp(loginPage()  /*MainScreen()*/);
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title:'HEALTH_APP',
     home:AnimatedSplashScreen(splash:Icons.health_and_safety_rounded,
     duration:3000,
     nextScreen:loginPage(),// MainScreen(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.blue,
    //Center(
    //     child:Column(
    //       mainAxisAlignment:MainAxisAlignment.center ,
    //       children:<Widget>[
    //       getImage(),
    //       Container(
    //         decoration:BoxDecoration(
    //           color:Colors.lightGreen,
    //           border: Border.all(
    //     color: Colors.green,
    // ),
    // borderRadius: BorderRadius.circular(10.0),),
    //         height: 50.0,
    //         width: 200.0,
            
            
    //       child:const Text(
    //         'HEALTH APP',
    //         textAlign: TextAlign.center,
    //        style:TextStyle(color:Colors.green ,fontSize:40,fontStyle:FontStyle.italic,
    //         )
    //     ),

    //   )]
    //     )
    //     ),
         ),
    
  );
  }
}
