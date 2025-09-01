import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';
import 'package:classic_gpa/presentation/pages/GPA/gpa_plus.dart';
import 'package:classic_gpa/presentation/pages/Home/home_card.dart';



class HomeInsights extends StatefulWidget {
  final String pageTitle;
  const HomeInsights({super.key, required this.pageTitle});

  @override
  State<HomeInsights> createState() => _HomeInsightsState();
}

class _HomeInsightsState extends State<HomeInsights> {

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
              children: [
                Text(
                  widget.pageTitle, // Use widget.pageTitle here
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
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
                                'Nota actual:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '--%',
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
                              Text('Nota objetivo',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('100.0%',
                                  style: TextStyle(color: Colors.white)),
                            ])),
                  ),
                ),
              ]),

              /*Expanded(
                child: ListView.builder(
                  // itemCount: _gpaPlusWidgetCount, // This variable is not defined here
                  itemBuilder: (context, i) {
                    // return GpaPlusWidget(yearNumber: i + 1); // GpaPlusWidget is not defined here
                    return Text("Placeholder for GpaPlusWidget"); // Placeholder
                  },
                ),
              ),*/

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
                                    builder: (context) =>  HomePage()));
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
