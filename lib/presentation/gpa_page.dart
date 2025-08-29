import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/home.dart';



class GpaPage extends StatefulWidget {
  const GpaPage({super.key});

  @override
  State<GpaPage> createState() => _GpaPageState();
}

class _GpaPageState extends State<GpaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }, icon: const Icon(Icons.arrow_back_ios_new_rounded),iconSize: 36,),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: const Text('Calculadora de GPA',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.add),iconSize: 40,),
              )
            ]
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Column(
                              children:[
                                Text('General',style: TextStyle(color: Colors.white),),
                                SizedBox(height: 10,),
                                Text('0.00',style: TextStyle(color: Colors.white),),
                              ]
                            )
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Column(
                                children:[
                                  Text('Concentracion',style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 10,),
                                  Text('0.00',style: TextStyle(color: Colors.white)),
                                ]
                            )
                        ),
                      ),
                    ),

                  ],

              ),

              ElevatedButton(onPressed: (){}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add),
                    Icon(Icons.add),
                    Icon(Icons.add),
                    Icon(Icons.add),

                  ]
              ))


            ]
        ),


      ),
    );
  }
}
