import 'package:flutter/material.dart';
import 'package:health_app/main.dart';
import 'package:health_app/home.dart';


class splash extends StatefulWidget {
  const splash({ Key? key }) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
 @override
 
  void InitState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children:<Widget>[
          getImage(),
          Container(
            decoration:BoxDecoration(
              color:Colors.lightGreen,
              border: Border.all(
        color: Colors.green,
    ),
    borderRadius: BorderRadius.circular(10.0),),
            height: 50.0,
            width: 200.0,
            
            
          child:const Text(
            'HEALTH APP',
            textAlign: TextAlign.center,
           style:TextStyle(color:Colors.green ,fontSize:40,fontStyle:FontStyle.italic,
            )
        ),

      )]
        )
        )
    );
  }
}
class getImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/avatar.jpg');
    Image image = Image(image: assetImage, width: 400, height: 400);
    return Container(
      child: image,
    );
  }
}

/*Widget getImage(){
    AssetImage assetImage = AssetImage('images/avatar.jpg');
    Image image =Image(image:assetImage , width:125 ,height:125);
    return Container(margin:EdgeInsets.all(90),child:image);
}*/
