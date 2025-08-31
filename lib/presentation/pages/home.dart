import 'package:classic_gpa/presentation/pages/gpa_page.dart';
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/home_plus.dart';


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
            titleSpacing: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Calculadora de Notas',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePlus()));
                }, icon: const Icon(Icons.add),iconSize: 40,),
              )
            ]
        ),
          body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 1,),
            Text("vacio",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200),),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(60, 60),
                        backgroundColor: Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calculate_outlined,color: Colors.white),
                          Text("Calificacion",style: TextStyle(color: Colors.white,fontSize: 16),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(60, 60),
                        backgroundColor: Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GpaPage()),);},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.book_outlined,color: Colors.white),
                        ],
                      ),
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
