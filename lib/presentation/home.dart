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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(60, 60),
                        backgroundColor: Colors.green[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);},
                      child: Icon(Icons.home,color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(60, 60),
                        backgroundColor: Colors.green[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GpaPage()),);},
                      child: Icon(Icons.menu_book,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),


      ),
    );
  }
}
