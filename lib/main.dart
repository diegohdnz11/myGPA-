import 'package:flutter/material.dart';

void main() {
  runApp(const MyGpa());
}

class MyGpa extends StatelessWidget {
  const MyGpa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
    appBar: AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new_rounded),iconSize: 36,),
    ),
    title: const Text('Calculadora de Notas',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.add),iconSize: 40,),
        )
      ]
    ),body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Text(
          "vacio",style: TextStyle(fontWeight: FontWeight.w200),),
          const SizedBox(height: 250,),
          Row(
            children: [
              Expanded(child: ElevatedButton.icon(onPressed: (){}, label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Calificacion'),
                  Text('GPA '),

                ],
              ), icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Icon(Icons.calculate_rounded),
                  Icon(Icons.calculate_rounded),
                ]
              ))),
              const SizedBox(height: 100,),
            ],
          ),



          ]
      ),
    )
    );
  }
}
