// ignore_for_file: file_names

import 'package:flutter/material.dart';



// BMR CALCULATOR ON-PRESSED
class BMRpage extends StatefulWidget {
  const BMRpage({ Key? key }) : super(key: key);
  @override
  BMRpageState createState() => BMRpageState();
}

enum Gender {male,female}

class BMRpageState extends State<BMRpage> {
  
    Gender? _character = Gender.male;
  var gender=['male' , 'female'];
  //var itemSelected ;
  var displayBMR ='';
  var exercise=['Sedentary:Little or no exercise' , ' Light :Exercise 1-3 times per week ', 'Moderate :4-5 times per week ', 'Active :daily exercise or intense exercise 3-4 times a week ',' Very Active:intense exercise 6-7 times a week ',' Extra Active : very intense exercise daily or physical job  '];
  var itemSelected = '';
  var itemSelected2='';
  
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  //TextEditingController genderController=TextEditingController();
  
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
          
        Expanded(
            child: Padding(
             padding:(const EdgeInsets.only(left:30.0,right:290.0)),
             child:ListTile(
          title: const Text('male'),
          leading: Radio<Gender>(
            value: Gender.male,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
            ),
          ), 

          Expanded(
            child: Padding(
             padding:(const EdgeInsets.only(left:30.0,right:290.0)),
             child:ListTile(
          title: const Text('female'),
          leading: Radio<Gender>(
            value: Gender.female,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
            ),
          ),
          

          //  Padding(
          //    padding:(const EdgeInsets.only(left:25.0)),
          //    child:

          //     DropdownButton<String>(
          //       items:gender.map((String dropDownStringItem){
          //         return DropdownMenuItem<String>(
          //           value:dropDownStringItem,
          //           child:Text(dropDownStringItem),
          //         );
          //       }).toList(),
          //       value:itemSelected1,
          //       onChanged:(newValueSelected1) {
          //         onDropDownItemSelected(newValueSelected1);
          //       },
          //     )
          //     ),

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


              Expanded(
              child:Padding(
             padding:(const EdgeInsets.only(left:25.0)),
             child:
              DropdownButton<String>(
                items:exercise.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value:dropDownStringItem,
                    child:Text(dropDownStringItem),
                  );
                }).toList(),
                value:itemSelected,
                onChanged:(newValueSelected) {
                  itemSelected=newValueSelected!;
                },
              )),
              ),


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
    double age =double.parse(ageController.text);
    var male =5;
    var female= -161;
    var Gender=[male,female];

    double BMR = (10*weight)+(6.2*height)-(5*age);
    String result= "your BMR is $BMR";
    return result;
      

  
  }

}

