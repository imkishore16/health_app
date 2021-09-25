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
  
  Gender? _gender = Gender.male;
  var gender=['male' , 'female'];
  var displayBMR ='';
  var exercise=['Sedentary:Little or no exercise' , ' Light :Exercise 1-3 times per week ', 'Moderate :4-5 times per week ', 'Active :daily exercise or intense exercise 3-4 times a week ',' Very Active:intense exercise 6-7 times a week ',' Extra Active : very intense exercise daily or physical job  '];
  var itemSelected ;
  //var itemSelected2='';
  
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  //TextEditingController genderController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    //final urlImage='https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.alamy.com%2Fstock-photo%2Fbmi-body-mass.html&psig=AOvVaw08xsO-IFB7tu7LeFFNf7up&ust=1631783146904000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMCfgYrQgPMCFQAAAAAdAAAAABAD';
    return Scaffold(
      appBar:AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      
      body:Container(
            decoration:BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/backgroung.jpg'),
                fit:BoxFit.cover,
              ),
            ),  
            child:ListView(
        children:<Widget>[
         // Container()
          Padding(
          padding:const EdgeInsets.only(top:10.0,),
            child:Container(
              height:30.0,
              width:5.0,
            )
            ),

            Expanded(
            child: Padding(
             padding:(const EdgeInsets.only(left:30.0,right:20.0)),
             child:Container(height:50,
               width: 50,
               child:ListTile(
          title: const Text('male'),
          leading: Radio<Gender>(
            value: Gender.male,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
             )
            ),
          ),
          
        Expanded(
            child: Padding(
             padding:(const EdgeInsets.only(left:30.0,right:20.0)),
             child:Container(height:50,
               width: 50,
               child:ListTile(
          title: const Text('female'),
          leading: Radio<Gender>(
            value: Gender.female,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
             )
            ),
          ), 
  
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
                underline:const SizedBox(),
                onChanged:(newValueSelected) {
                  setState(() {
                    itemSelected=newValueSelected!;
                  });
                },
                hint: const Text("exercise"),
                value:itemSelected,
              )),
              ),


             Padding(
                  padding:const EdgeInsets.only(left:90.0,right:90.0,bottom:20,top:20.0),
                child:ElevatedButton(
                  child:const Text(
                    'CALCULATE',
                    textScaleFactor: 1.0,
                    style:TextStyle(color:Colors.black,fontStyle:FontStyle.italic),
                  ),
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    side: const BorderSide(width:1, color:Colors.black), 
                    elevation: 5, 
                  ),   
                onPressed:(){
                  FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        } 
                setState(() {
                        displayBMR=calculateBMR()!;
                      });
                    }
                )
              )   ,

              Padding(
                  padding:const EdgeInsets.only(left:90.0,right:90.0,bottom:20),
                child:ElevatedButton(
                  child:const Text(
                    'RESET',
                    textScaleFactor: 1.0,
                    style:TextStyle(color:Colors.black,fontStyle:FontStyle.italic),
                  ),
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    side: const BorderSide(width:1, color:Colors.black), 
                    elevation: 5, 
                  ),
                onPressed:(){
                setState(() {
                        reset();
                      });
                    }
                )
              )   ,

                Expanded(child:Padding(
                padding:const EdgeInsets.all(8.0),
                child:Text(displayBMR,
                
                style:const TextStyle(color:Colors.black,fontSize:18.0,fontStyle:FontStyle.italic)
                ),
              ),),


        ],
      )
          ),
    );
  }

  void onDropDownItemSelected( newValueSelected){
    setState() {
      itemSelected = newValueSelected;
    }
  }

  String? calculateBMR() {
    double height =double.parse(heightController.text);
    double weight =double.parse(weightController.text);
    double age =double.parse(ageController.text);


  if(_gender == Gender.male){
    double BMR = (10*weight)+(6.2*height)-(5*age)+5;
    var value=BMR.round();
    String result= "BMR = $BMR calories/day";
    return result;
  }
  else() {
    double BMR = (10*weight)+(6.2*height)-(5*age)-161;
    var value=BMR.round();
    String result= "BMR = $BMR calories/day";
    return result;
  };
    
    //String result= "your BMR is $BMR";
    //return result;  
  }

  reset() {
    heightController.text='';
    weightController.text='';
    ageController.text='';
    displayBMR='';
  }
}

