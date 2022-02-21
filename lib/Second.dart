

import 'package:flutter/material.dart';
class Second extends StatefulWidget{
   final int day,month,year;
   final String week;
  Second({Key key,@required this.day,this.month,this.year,this.week}):super(key : key);

  @override 

  _SecondState createState()=> _SecondState(day,month,year,week);

}
class _SecondState extends State<Second>{
int day,month,year;
String week;
_SecondState( this.day,this.month,this.year,this.week);
  @override 
  
  Widget build(BuildContext context){
    
    return Scaffold(
       backgroundColor: Colors.grey[200],
       appBar: AppBar(
         centerTitle: true,
       title: Text("Week Calculater",
       style: TextStyle(color: Colors.orange)
       ),
         ),
        body: SafeArea(
          
          child: ListView(
           
            padding: EdgeInsets.all(30),
          children: [
            Container(
              alignment: Alignment.center,
               child:Text("THE WEEK OF GIVEN DATE: $day / $month / $year",
               style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 20.0,
               color:  Colors.greenAccent
               ),
               textAlign: TextAlign.center,
               )
             ),
             SizedBox(
               height: 30,
             ),
             Container(
               alignment: Alignment.center,
               child:Text("$week",
               style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 25.0,
               color:  Colors.red[200]
               ),
               textAlign: TextAlign.center,
               )
             ),
             SizedBox(
               height: 30,
             ),
             
              Container(
                alignment: Alignment.center,

                child: ElevatedButton(
                 child: Text("Back",
                 style: TextStyle(color: Colors.lime),
                 textAlign: TextAlign.center,
                 ),
                
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 
                 
                 
             ),
              )
             
          ],
        ),
        ),
    );

  }

}