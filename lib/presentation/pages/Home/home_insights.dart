import 'package:classic_gpa/presentation/pages/Home/setObjective.dart';
import 'package:classic_gpa/presentation/widgets/homework_card.dart';
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';

class HomeInsights extends StatefulWidget {
  final String pageTitle;
  const HomeInsights({super.key, required this.pageTitle});

  @override
  State<HomeInsights> createState() => _HomeInsightsState();
}

class _HomeInsightsState extends State<HomeInsights> {
  List<Map<String, String>> homeworkList = [];

  void addHomework() async {
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ObjectivePage()),
    );

    if (result != null) {
      setState(() {
        homeworkList.add(result);
      });
    } else {
    }
  }

  void deleteHomework(int i) {
    setState(() {
      homeworkList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                widget.pageTitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: addHomework,
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
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.6),
                            spreadRadius: 5,
                            blurRadius: 5,
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
                                  color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '--%',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ])),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 18, 18, 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 90),
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black54,
                      elevation: 12,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Nota objetivo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            content:  Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                border: Border.all(color: Colors.green, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "100.0",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "%",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[300],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        shadowColor: Colors.grey.withValues(alpha: 0.6),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancelar",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[700],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        shadowColor: Colors.grey.withValues(alpha: 0.6),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Listo",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      );
                    },
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Nota objetivo',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('100.0%',
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                          ])),



                ),
              ),
            ]),
            Expanded(
              child: homeworkList.isEmpty ?  Center(
                      child: Text(
                        "vacio",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: homeworkList.length,
                      itemBuilder: (context, i) {
                        final item = homeworkList[i];
                        return HomeWorkCard(
                          courseName: item['name'] ?? 'No Name',
                          percentage: item['percent'] ?? '0',
                          onDelete: () => deleteHomework(i),
                        );
                      },
                    ),
            ),
          ]
      ),
    );
  }
}
