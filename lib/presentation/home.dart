import 'package:classic_gpa/presentation/gpa_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new_rounded),iconSize: 36,),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: const Text('Calculadora de Notas',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.add),iconSize: 40,),
              )
            ]
        ),
          body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

                Center(

                      child: ElevatedButton.icon(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GpaPage()));
                      }, label: Icon(Icons.school_outlined))

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
