import 'package:classic_gpa/presentation/pages/GPA/gpa_page.dart';
import 'package:classic_gpa/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> courses = [];

  void _addCourse() async {
    final newCourse = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => const HomePlus()),);

    if(newCourse != null && newCourse.toString().isNotEmpty) {
      setState(() {
        courses.add(newCourse.toString());
      });
    }
  }

  void _deleteCourse(String course) {
    setState(() {
      courses.remove(course);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {},
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
                  onPressed: _addCourse,
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
              )
            ]),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: courses.isEmpty ?  Center(
                        child: Text(
                          "vacio",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: courses.length,
                        itemBuilder: (context, i) {
                          final course = courses[i];
                          return Center(
                            child: HomeCard(
                              courseName: course,
                              onDelete: () => _deleteCourse(course),
                            ),
                          );
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
                          onTap: () {},
                          child: const SizedBox.expand(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calculate_outlined, color: Colors.white),
                                SizedBox(width: 8),
                                Text("Calificación",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GpaPage()));
                          },
                          child: const SizedBox.expand(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.book_outlined, color: Colors.white),
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
