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
              leading:Icon(Icons.health_and_safety_rounded, color:Colors.green),
              title:Text(
                'BMI CALCULATOR',
                style:TextStyle(fontSize:20,fontStyle: FontStyle.italic)
              ),
              trailing:Icon(Icons.keyboard_arrow_right),
              onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>BMIpage()));
              },
            ),
            ListTile(
              leading:Icon(Icons.health_and_safety_rounded, color:Colors.green),
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
  
  var gender=['male' , 'female'];
  var itemSelected ='male';
  var displayBMI ='';
  
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  //TextEditingController ageController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body:ListView(
        children:<Widget>[

          Padding(
          padding:EdgeInsets.only(top:10.0,),
            child:Container(
              height:30.0,
              width:5.0,
            )
            ),
          
           Padding(
             padding:(EdgeInsets.only(left:25.0)),
             child:
              DropdownButton<String>(
                items:gender.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value:dropDownStringItem,
                    child:Text(dropDownStringItem),
                  );
                }).toList(),
                value:itemSelected,
                onChanged:( newValueSelected) {
                  onDropDownItemSelected(newValueSelected);
                },
              )),

           Padding(
            padding:(const EdgeInsets.only(top:5.0,bottom:5.0)),
            child: TextField(
              controller:weightController,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(
                border:OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'Weight',
                hintText:'in Kgs',
               // onChanged:(){

              //}
              ))), 


              Padding(
            padding:(const EdgeInsets.only(top:5.0,bottom:5.0)),
            child: TextField(
              controller:heightController,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'Height',
                hintText: 'in cm'
              ))),


           /* Padding(
            padding:(EdgeInsets.only(top:2.0,bottom:2.0)),
            child: TextField(
              controller:ageController,
              keyboardType:TextInputType.number,
              decoration:InputDecoration(
                border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'age',
              ))),   */

              Expanded(
                child:ElevatedButton(
                  child:const Text(
                    'CALCULATE',
                    textScaleFactor: 1.0,
                    style:TextStyle(color:Colors.black,fontStyle:FontStyle.italic),
                  ),
                   onPressed:(){
                      setState(() {
                        displayBMI=calculateBMI();
                        //print(calculateBMI());
                      });
                    }

                )
              ),
              Expanded(child:Padding(
                padding:const EdgeInsets.all(8.0),
                child:Text(displayBMI,
                
                style:const TextStyle(color:Colors.black,fontSize:18.0,fontStyle:FontStyle.italic)
                ),
              ),),

              const Expanded(
                child: Padding(
                padding:EdgeInsets.all(10.0),
                child:Text('Severe  Thinness	< 16   ,   Moderate Thinness	16 - 17  ,   Mild Thinness	17 - 18.5   ,   Normal	18.5 - 25   ,   Overweight	25 - 30    ,   Obese Class I	30 - 35    ,     Obese Class II	35 - 40   ,   Obese Class III	> 40 ')
              )
              ),

              
     
        ],
      )
    );
  }

void onDropDownItemSelected( newValueSelected){
    setState() {
      itemSelected = newValueSelected;
    }
  }  

  String calculateBMI() {
    double height =double.parse(heightController.text);
    double weight =double.parse(weightController.text);
   // double age =double.parse(ageController.text);

    double BMI = (weight*10000)/(height*height);
    String result= "your BMI is $BMI";
    return result;
      

  }

}


// BMR CALCULATOR ON-PRESSED
class BMRpage extends StatefulWidget {
  const BMRpage({ Key? key }) : super(key: key);
  @override
  _BMRpageState createState() => _BMRpageState();
}

class _BMRpageState extends State<BMIpage> {
  
  var gender=['male' , 'female'];
  var itemSelected ='male';
  var displayBMR ='';
  var exercise=['Sedentary:Little or no exercise , Light :Exercise 1-3 times per week ,Moderate :4-5 times per week , Active :daily exercise or intense exercise 3-4 times a week , Very Active:intense exercise 6-7 times a week , Extra Active : very intense exercise daily or physical job  '];
  var itemSelected1 = '';
  
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body:ListView(
        children:<Widget>[

          Padding(
          padding:const EdgeInsets.only(top:10.0,),
            child:Container(
              height:30.0,
              width:5.0,
            )
            ),
          
           Padding(
             padding:(const EdgeInsets.only(left:25.0)),
             child:
              DropdownButton<String>(
                items:gender.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value:dropDownStringItem,
                    child:Text(dropDownStringItem),
                  );
                }).toList(),
                value:itemSelected1,
                onChanged:(newValueSelected) {
                  onDropDownItemSelected(newValueSelected);
                },
              )),

           Padding(
            padding:(const EdgeInsets.only(top:5.0,bottom:5.0)),
            child: TextField(
              controller:weightController,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(
                border:OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'Weight',
                hintText:'in Kgs',
               // onChanged:(){

              //}
              ))), 


              Padding(
            padding:(const EdgeInsets.only(top:5.0,bottom:5.0)),
            child: TextField(
              controller:heightController,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'Height',
                hintText: 'in cm'
              ))),


           Padding(
            padding:(const EdgeInsets.only(top:2.0,bottom:2.0)),
            child: TextField(
              controller:ageController,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10.0))
              ),
                labelText:'age',
              ))),   


              Padding(
             padding:(const EdgeInsets.only(left:25.0)),
             child:
              DropdownButton<String>(
                items:exercise.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value:dropDownStringItem,
                    child:Text(dropDownStringItem),
                  );
                }).toList(),
                value:itemSelected1,
                onChanged:(newValueSelected) {
                  onDropDownItemSelected(newValueSelected);
                },
              )),


              Expanded(
                child:ElevatedButton(
                  child:const Text(
                    'CALCULATE',
                    textScaleFactor: 1.0,
                    style:TextStyle(color:Colors.black,fontStyle:FontStyle.italic),
                  ),
                   onPressed:(){
                      setState(() {
                        displayBMR=calculateBMR();
                      });
                    }

                )
              ),


        ],
      )
    );
  }

  void onDropDownItemSelected( newValueSelected){
    setState() {
      itemSelected = newValueSelected;
    }
  }

  String calculateBMR() {
    double height =double.parse(heightController.text);
    double weight =double.parse(weightController.text);
   // double age =double.parse(ageController.text);

    double BMR = (weight*10000)/(height*height);
    String result= "your BMR is $BMR";
    return result;
      

  
  }

}




