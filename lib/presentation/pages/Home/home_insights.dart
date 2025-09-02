import 'package:classic_gpa/presentation/pages/Home/setObjective.dart';
import 'package:classic_gpa/presentation/widgets/homework_card.dart'; // Import HomeworkCard
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';

class HomeInsights extends StatefulWidget {
  final String pageTitle;
  const HomeInsights({super.key, required this.pageTitle});

  @override
  State<HomeInsights> createState() => _HomeInsightsState();
}

class _HomeInsightsState extends State<HomeInsights> {
  List<Map<String, String>> _homeworkItems = [];

  void _navigateAndAddHomework() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ObjectivePage()),
    );


    if (result != null && result is Map<String, String>) {
      setState(() {
        _homeworkItems.add(result);
      });
    } else {
    }
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
                onPressed: _navigateAndAddHomework,
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
            Expanded(
              child: _homeworkItems.isEmpty
                  ? const Center(
                      child: Text(
                        "vacio",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: _homeworkItems.length,
                      itemBuilder: (context, index) {
                        final item = _homeworkItems[index];
                        print("[HomeInsights] ListView.builder itemBuilder - item: $item"); // DEBUG PRINT
                        return HomeWorkCard(
                          courseName: item['name'] ?? 'No Name', 
                          percentage: item['percent'] ?? '0',
                        );
                      },
                    ),
            ),
          ]
      ),
    );
  }
}
