// ignore_for_file: file_names

import 'package:flutter/material.dart';




// BMI CALCULATOR ON-PRESSED
class BMIpage extends StatefulWidget {
  const BMIpage({ Key? key }) : super(key: key);
  @override
  _BMIpageState createState() => _BMIpageState();
}

enum Gender { male, female }

class _BMIpageState extends State<BMIpage> {
  
  
  Gender? _male = Gender.male;  
   
  
  var displayBMI ='';
  var data=['Severe  Thinness	< 16',"Moderate Thinness	16 - 17","Mild Thinness	17 - 18.5  "," Normal	18.5 - 25  "," Overweight	25 - 30  ","Obese Class I	30 - 35   ","Obese Class II 35 - 40   ","Obese Class III > 40   "];
  
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
          padding:const EdgeInsets.only(top:10.0,),
            child:Container(
              height:30.0,
              width:5.0,
            )
            ),  


          Expanded(
            child: Padding(
             padding:(const EdgeInsets.only(left:30.0,right:20.0)),
             child:Container(
               height:50,
               width: 50,
               child:ListTile(
          title: const Text('male'),
          leading: Radio<Gender>(
            value: Gender.male,
            groupValue: _male,
            onChanged: (Gender? value) {
              setState(() {
                _male= value;
              });
            },
          ),
        ),
             )
             

        
             
              // DropdownButton<String>(   
              //   items:gender.map((String dropDownItem){
              //     return DropdownMenuItem<String>(
                    
              //       value:dropDownItem,
              //       child:Text(dropDownItem),
              //     );
              //   }).toList(),
              //   underline: const SizedBox(),
              //   onChanged:( newValueSelected) {
              //     //onDropDownItemSelected(newValueSelected)
              //     setState(() {
              //       itemSelected=newValueSelected!;
              //     });
              //   },
              //  hint: //const Align(
              //    const Text("gender"),
              // ) 
              //   value:itemSelected,
              // )
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
            groupValue: _male,
            onChanged: (Gender? value) {
              setState(() {
                _male = value;
              });
            },
          ),
        ),
             )
            ),
          ), 
           
           Padding(
            padding:(const EdgeInsets.only(top:10.0,bottom:10.0,left:30.0,right:30.0)),
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
            padding:(const EdgeInsets.only(top:10.0,bottom:10.0,left:30.0,right:30.0)),
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
                   /*style:const ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    fixedSize: MaterialStateProperty<Size>(fixedSize:)
                    elevation:MaterialStateProperty.all<double>(5.0), 
                    minimumSize: MaterialStateProperty.all<Size>(super(3.0, 3,0)),
                  ),*/
                onPressed:(){
                   FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
                setState(() {
                        displayBMI=calculateBMI();
                      });
                    }
                )
              )   ,

              Padding(
                  padding:const EdgeInsets.only(left:90.0,right:90.0,bottom:20,top:20.0),
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
                child:Text(displayBMI,
                
                style:const TextStyle(color:Colors.black,fontSize:18.0,fontStyle:FontStyle.italic)
                ),
              ),),


//TABLE
            Padding(
              padding:EdgeInsets.only(top:10.0,bottom:10.0,left:50.0,right:50.0),
            child:Table(
  border: TableBorder.all(width: 1.2, color: Colors.blue,borderRadius:BorderRadius.circular(4.8),),
  
  children: data.map((info){
    return TableRow(children: [
      TableCell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, 
          children: <Widget>[ Text(info,textScaleFactor: 1.2,textAlign:TextAlign.center)],
        ),
      )
    ]);
  }).toList()
),),
            

        ],
      )
    );
  }

   
  //  getData(List<String> x){
  //    for(int i=0;i<=3;i++){
  //   return (x[i]);
  // }
  //   //print(data);
  //   }

/*void onDropDownItemSelected( newValueSelected){
    setState() {
      itemSelected = newValueSelected;
    }
  }*/  

  String calculateBMI() {
    double height =double.parse(heightController.text);
    double weight =double.parse(weightController.text);
   // double age =double.parse(ageController.text);

    double BMI = (weight*10000)/(height*height);
    var value =BMI.round();
    String result= "your BMI is $value";
    return result; 
  }

  reset() {
    heightController.text='';
    weightController.text='';
    displayBMI='';
  }
}

