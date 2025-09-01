import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/home.dart';
import 'package:classic_gpa/presentation/pages/gpa_plus.dart'; // Import the new widget

class GpaPage extends StatefulWidget {
  const GpaPage({super.key});

  @override
  State<GpaPage> createState() => _GpaPageState();
}

class _GpaPageState extends State<GpaPage> {
  int _gpaPlusWidgetCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                iconSize: 36,
              ),
            ),
            titleSpacing: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Calculadora de Notas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _gpaPlusWidgetCount++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
              )
            ]),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 10, 12),
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.green[800],
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ 
                              Text(
                                'General',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '0.00',
                                style: TextStyle(color: Colors.white),
                              ),
                            ])),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 18, 18, 12),
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), 
                            ),
                          ],
                          color: Colors.green[800],
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ 
                              Text('Concentracion',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('0.00',
                                  style: TextStyle(color: Colors.white)),
                            ])),
                  ),
                ),
              ]),

              Expanded(
                child: ListView.builder(
                  itemCount: _gpaPlusWidgetCount,
                  itemBuilder: (context, index) {
                    return const GpaPlusWidget(); 
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage())); 
                          },
                          child: const SizedBox.expand( 
                            child: Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Icon(Icons.calculate_outlined,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox.expand(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [ 
                                Icon(Icons.book_outlined, color: Colors.white),
                                SizedBox(width: 8),
                                Text("GPA",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
