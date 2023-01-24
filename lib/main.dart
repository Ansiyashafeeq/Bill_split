

import 'package:bill_split/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const Bill(),));
}

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  double slidervalue =0;
  double tipvalue=0;
  String taxvalue='0';
  String totalvalue='';

   calc(String s){
    return Expanded(
      child: OutlinedButton(onPressed: (){
      if(s=='-'){
        setState(
            (){
              totalvalue='';
            }
        );

      }
      else{
        setState(
            (){
              totalvalue=s+totalvalue;
            }
        );

      }
      } ,child: Text(s,style: TextStyle(color: Colors.black,fontSize: 25),),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft,
                  child: Text('Split Bill',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   height:100,
                  width: double.maxFinite,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text('Total',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('$totalvalue',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Friends',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text('Tax',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text('Tip',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                ],

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${slidervalue.round()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text('$taxvalue%',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text('\$$tipvalue',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                ],

                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('How many friends ?',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(min: 0,
                    max: 100,
                    divisions: 25,
                    activeColor: Colors.deepOrangeAccent,
                    inactiveColor: Colors.blueGrey,

                    value: slidervalue, onChanged:(value){
                  setState(
                      (){
                        slidervalue=value;
                      }
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,


                      child: Container(
                         height: 100,
                        //width: 250,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              FloatingActionButton(onPressed: (){
                               setState(
                                   (){
                                     tipvalue++;
                                   }
                               );
                              },
                                backgroundColor: Colors.blueGrey,
                              child:Icon(Icons.add,color: Colors.black,),
                              ),
                              Column(
                                children: [
                                  Text('TIP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                                  Text('\$$tipvalue',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                                ],
                              ),
                              FloatingActionButton(onPressed: (){
                              setState((){
                                tipvalue--;
                              });
                              },
                                backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.remove,color: Colors.black,),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 35,),
                    Expanded(
                      child: Container(
                       height: 100,
                        //width: 180,
                        decoration: BoxDecoration( color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              keyboardType: TextInputType.number,
                           onChanged: (value){
                             setState(
                                 (){
                                   taxvalue=value;
                                 }
                             );
                           },
                            decoration: InputDecoration(labelText: 'Tax in %,',contentPadding: EdgeInsets.symmetric(vertical: 60),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    calc('1'),
                    calc('2'),
                    calc('3'),

                  ],
                ),
              ),
              Row(
                children: [
                  calc('4'),
                  calc('5'),
                  calc('6'),

                ],
              ),
              Row(
                children: [
                  calc('7'),
                  calc('8'),
                  calc('9'),

                ],
              ),
              Row(
                children: [
                  calc('.'),
                  calc('0'),
                  calc('-'),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                        width: double.maxFinite,
                  height: 30,
                  color: Colors.green,
                  child: ElevatedButton(
                    onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(tipvalue,totalvalue,taxvalue,slidervalue)));
                  },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text('Split Bill',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
