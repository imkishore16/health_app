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
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>const BMIpage()));
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


// BMI CALCULATOR ON-PRESSED
class BMIpage extends StatefulWidget {
  const BMIpage({ Key? key }) : super(key: key);
  @override
  _BMIpageState createState() => _BMIpageState();
}

class _BMIpageState extends State<BMIpage> {
  
  var gender=['male' , 'female'];
  var itemSelected ;
  var displayBMI ='';
  //var data=['A','B','c','D'];
  
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
          
           Padding(
             padding:(const EdgeInsets.only(left:20.0,right:300.0)),
             child:
              DropdownButton<String>(
                //hint:Text('gender'),
                items:gender.map((String dropDownItem){
                  return DropdownMenuItem<String>(
                    
                    value:dropDownItem,
                    child:Text(dropDownItem),
                  );
                }).toList(),
                
                onChanged:( newValueSelected) {
                  //onDropDownItemSelected(newValueSelected)
                  setState(() {
                    itemSelected=newValueSelected!;
                  });
                },
               hint: //const Align(
                 const Text("gender"),
              //)
                value:itemSelected,
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
                  padding:EdgeInsets.only(left:90.0,right:90.0,bottom:10),
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
                setState(() {
                        displayBMI=calculateBMI();
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
               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( 
                          
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3),
            ),
            columnWidths: const {
                           0:  FixedColumnWidth(2),
                          },
            children:const [
              TableRow(
                children: [
                  Text("Severe  Thinness	< 16",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),

               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table(
                  
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3),
            ),
            columnWidths: const {
                           0:  FixedColumnWidth(2),
                          //1:  FixedColumnWidth(80)
                          },
            
            children: const[
              TableRow(
                children: [
                  Text("Moderate Thinness	16 - 17",textScaleFactor: 1.2,textAlign:TextAlign.center),
                  
                ]
              ),
            ]
              ),
              ),
               ),

            Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( columnWidths: const {
                           0:  FixedColumnWidth(200 ),
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children: const[
              TableRow(
                children: [
                  
                  Text("Mild Thinness	17 - 18.5  ",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),
               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( 
                  columnWidths: const {
                           0:  FixedColumnWidth(80),
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children: const[
              TableRow(
                children: [
                  Text(" Normal	18.5 - 25  ",textScaleFactor: 1.2,textAlign:TextAlign.center),                
                ]
              ),
            ]
              ),
              ),
               ),

               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( 
                  columnWidths: const {
                           0:  FixedColumnWidth(80),
                          1:  FixedColumnWidth(80)
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children: const[
              TableRow(
                children: [
                  Text(" Overweight	25 - 30  ",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),

               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( 
                  columnWidths: const {
                           0:  FixedColumnWidth(80),
                          1:  FixedColumnWidth(80)
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children: const[
              TableRow(
                children: [
                  Text("Obese Class I	30 - 35   ",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),

               Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( 
                  columnWidths: const {
                           0:  FixedColumnWidth(80),
                          1:  FixedColumnWidth(80)
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children: const[
              TableRow(
                children: [
                  Text(" Obese Class II	35 - 40 ",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),
              
                Expanded(
                child:Padding(
                padding:const EdgeInsets.only(left:15.0,right:15.0,top:5.0,bottom:5.0),
                child: Table( columnWidths: const {
                           0:  FixedColumnWidth(80),
                          1:  FixedColumnWidth(80)
                          },
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1,color: Colors.blue,
            borderRadius:BorderRadius.circular(3.0),
            ),
            children:const  [
               TableRow(
                children: [
                Text(" Obese Class III	> 40 ",textScaleFactor: 1.2,textAlign:TextAlign.center),
                ]
              ),
            ]
              ),
              ),
               ),   


            // Expanded(
            //   child:Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child:Table(
            //       border:TableBorder.all(width: 1,color: Colors.blue,
            //        borderRadius:BorderRadius.circular(3.0),
            //       ),
            //       children: [
            //             TableRow(
            //               children:[
            //                 Text(getData(data)),
            //               ]
            //             )
            //       ]
            //     )
            //     )
            // )


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
    String result= "your BMI is $BMI";
    return result;
      

  }
}













// BMR CALCULATOR ON-PRESSED
class BMRpage extends StatefulWidget {
  const BMRpage({ Key? key }) : super(key: key);
  @override
  BMRpageState createState() => BMRpageState();
}

class BMRpageState extends State<BMRpage> {
  
  var gender=['male' , 'female'];
  var itemSelected ='male';
  var displayBMR ='';
  var exercise=['Sedentary:Little or no exercise' , ' Light :Exercise 1-3 times per week ', 'Moderate :4-5 times per week ', 'Active :daily exercise or intense exercise 3-4 times a week ',' Very Active:intense exercise 6-7 times a week ',' Extra Active : very intense exercise daily or physical job  '];
  var itemSelected1 = '';
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
                onChanged:(newValueSelected1) {
                  onDropDownItemSelected(newValueSelected1);
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


              Expanded(
              child:Padding(
             padding:(const EdgeInsets.only(left:25.0)),
             child:
              DropdownButton<String>(
                items:exercise.map((String dropDownStringItem1){
                  return DropdownMenuItem<String>(
                    value:dropDownStringItem1,
                    child:Text(dropDownStringItem1),
                  );
                }).toList(),
                value:itemSelected2,
                onChanged:(newValueSelected2) {
                  itemSelected2=newValueSelected2!;
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
      itemSelected1 = newValueSelected;
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





