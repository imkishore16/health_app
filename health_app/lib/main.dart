// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:health_app/splash.dart';
// import 'package:health_app/home.dart';

// void main() {
//   runApp(
//    Screen()
    
//    /* MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title:'HEALTH_APP',
//     home:splash(),
    
//   ) */);
// }

// class Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title:'HEALTH_APP',
//      home:AnimatedSplashScreen(splash:Icons.health_and_safety_rounded,
//      duration:3000,
//      nextScreen: MainScreen(),
//           splashTransition: SplashTransition.fadeTransition,
//           //pageTransitionType: PageTransitionType.scale,
//           backgroundColor: Colors.blue,
//     //Center(
//     //     child:Column(
//     //       mainAxisAlignment:MainAxisAlignment.center ,
//     //       children:<Widget>[
//     //       getImage(),
//     //       Container(
//     //         decoration:BoxDecoration(
//     //           color:Colors.lightGreen,
//     //           border: Border.all(
//     //     color: Colors.green,
//     // ),
//     // borderRadius: BorderRadius.circular(10.0),),
//     //         height: 50.0,
//     //         width: 200.0,
            
            
//     //       child:const Text(
//     //         'HEALTH APP',
//     //         textAlign: TextAlign.center,
//     //        style:TextStyle(color:Colors.green ,fontSize:40,fontStyle:FontStyle.italic,
//     //         )
//     //     ),

//     //   )]
//     //     )
//     //     ),
//          ),
    
//   );
//   }
// }
import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
/// This Widget is the main application widget.  
class MyApp extends StatelessWidget {  
  static const String _title = 'Radio Button Example';  
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: _title,  
      home: Scaffold(  
        appBar: AppBar(title: const Text(_title)),  
        body: Center(  
          child: MyStatefulWidget(),  
        ),  
      ),  
    );  
  }  
}  
  
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }  
  
class MyStatefulWidget extends StatefulWidget {  
  MyStatefulWidget({Key key}) : super(key: key);  
  
  @override  
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();  
}  
  
class _MyStatefulWidgetState extends State<MyStatefulWidget> {  
  BestTutorSite _site = BestTutorSite.javatpoint;  
  
  Widget build(BuildContext context) {  
    return Column(  
      children: <Widget>[  
        ListTile(  
          title: const Text('www.javatpoint.com'),  
          leading: Radio(  
            value: BestTutorSite.javatpoint,  
            groupValue: _site,  
            onChanged: (BestTutorSite value) {  
              setState(() {  
                _site = value;  
              });  
            },  
          ),  
        ),  
        ListTile(  
          title: const Text('www.w3school.com'),  
          leading: Radio(  
            value: BestTutorSite.w3schools,  
            groupValue: _site,  
            onChanged: (BestTutorSite value) {  
              setState(() {  
                _site = value;  
              });  
            },  
          ),  
        ),  
        ListTile(  
          title: const Text('www.tutorialandexample.com'),  
          leading: Radio(  
            value: BestTutorSite.tutorialandexample,  
            groupValue: _site,  
            onChanged: (BestTutorSite value) {  
              setState(() {  
                _site = value;  
              });  
            },  
          ),  
        ),  
      ],  
    );  
  }  
} 