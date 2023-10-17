import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bmi_result_2.dart';

class BmiCalculater extends StatefulWidget {
  const BmiCalculater({super.key});

  @override
  State<BmiCalculater> createState() => _BmiCalculaterState();
}

class _BmiCalculaterState extends State<BmiCalculater> {
  bool isMale=true;
  double hieghtValue=120;
  int age=16;
  int weight=40;
  double ?result;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
        appBar: AppBar(
          //centerTitle: true,
          title:const Text("BMI calculater",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          backgroundColor:Colors.black54,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  //male female
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;
                          });
                        },
                        child: Container(
                          //male
                          decoration: BoxDecoration(
                            color: isMale?Colors.redAccent:Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Image(image: AssetImage("images/man.png"))),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(247, 0, 121, 219),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      //female
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isMale? Colors.redAccent:Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Image(image: AssetImage("images/female.png"))),
                              Text(
                                "female",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 160, 191),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              //slider
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text(
                        "Hieght",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${hieghtValue.round()}",
                            style:const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                         const Text(
                            "CM",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                          )
                        ],
                      ),
                      Expanded(
                        child: Slider(
                            thumbColor: Colors.redAccent,
                            activeColor: Colors.redAccent,
                            value: hieghtValue,
                            max: 210,
                            min: 80,
                            onChanged: (value) {
                              setState(() {
                                hieghtValue=value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const  Text(
                              "Weight",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "$weight",
                              style:const TextStyle(
                                fontSize: 30,
                                color: Colors.white
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'weight++',
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  heroTag: 'weight--',
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      if (weight>40) {
                                        weight--;  
                                      }
                                      
                                    });
                                    
                                  },
                                  mini: true,
                                  child:const Icon(Icons.remove),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                   const SizedBox(width: 40,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const  Text(
                              "age",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "$age",
                              style:const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'age++',
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      if (age<100) {
                                        age++;  
                                      }else{
                                        age=90;
                                      }
                                      
                                    });
                                  },
                                  mini: true,
                                  child:const Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  heroTag: 'age--',
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      if(age>16){
                                        age--;
                                        }
                                      
                                    });
                                  },
                                  mini: true,
                                  child:const Icon(Icons.remove),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              color: Colors.redAccent,
              ),
              child: MaterialButton(
                onPressed: (){
                    result = weight / pow(hieghtValue / 100, 2);
                   print(result!.round());
                 Navigator.push(context, MaterialPageRoute(builder: (context) => BMIResult2(age:age ,gender:isMale ,result:result??1),));
                },
                child:const Text("Calculate"),
                ),
            )
          ],
        )
        );
  }
}
