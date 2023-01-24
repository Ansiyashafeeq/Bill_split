import 'package:bill_split/main.dart';
import 'package:flutter/material.dart';
class Result extends StatefulWidget {

  double tip;
  String total;
  String tax;

  double slide;


  Result(this.tip,this.total,this.tax,this.slide);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  double answer=0;
  void initState (){
    super.initState();
    eq();
  }
  void eq(){
    setState(
        (){
          double taxamount= double.parse(widget.total) *double.parse( widget.tax)/100;
          answer = (double.parse(widget.total)+taxamount+widget.tip)/widget.slide;
        }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
            Container(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Equaly divided'),
                        Text('\$${answer.round()}'),

                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('friende'),
                            Text('tax'),
                            Text('tip'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.total}'),
                            Text('${widget.tax}'),
                            Text('\$${widget.tip}'),

                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Text('Everybody should pay \$${answer.toStringAsFixed(2)}'),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bill()) );
            }, child: Text('Calculate again ?'),),
          ],

        ),
      ),
    );
  }
}
