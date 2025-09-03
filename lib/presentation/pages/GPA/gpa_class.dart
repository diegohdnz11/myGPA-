import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course {
  final String name;
  final int credits;
  final String grade;

  Course({required this.name, required this.credits, required this.grade});
}

class GpaClass extends StatefulWidget {
  const GpaClass({super.key});

  @override
  State<GpaClass> createState() => _GpaClassState();
}

class _GpaClassState extends State<GpaClass> {
  final text = TextEditingController();
  bool isConcentration = false;
  int selectedCredit = 1;
  String selectedGrade = "A";

  final List<int> ListCredits = [1, 2, 3, 4, 5];
  final List<String> ListGrades = ["A", "B", "C", "D", "F"];

  void Picker(BuildContext context, List<dynamic> items,
      dynamic selectedItem, Function(dynamic) onChanged) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (int i) {
            onChanged(items[i]);
          },
          scrollController: FixedExtentScrollController(
            initialItem: items.indexOf(selectedItem),
          ),
          children: items
              .map((item) => Center(child: Text(item.toString())))
              .toList(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 36,
          ),
        ),
        titleSpacing: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Añadir Clase',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Nombre del Curso",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 5),
                child: TextField(
                  controller: text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 6.5,
                      ),
                    ),
                    hintText: 'Introduzca el nombre',
                    contentPadding: const EdgeInsets.all(10),
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                child: Text(
                  "Creditos",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Picker(context, ListCredits, selectedCredit, (newCredit) {
                      setState(() {
                        selectedCredit = newCredit;
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), 
                    ),
                    minimumSize:
                        const Size(80, 50), 
                  ),
                  child: Text(
                    selectedCredit.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Text(
                  "Calificación",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Picker(context, ListGrades, selectedGrade, (newGrade) {
                      setState(() {
                        selectedGrade = newGrade;
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), 
                    ),
                    minimumSize:
                        const Size(80, 50), 
                  ),
                  child: Text(
                    selectedGrade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Text(
                  "¿Es concentración?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 25),
                child: CupertinoSwitch(
                  value: isConcentration,
                  onChanged: (value) {
                    setState(() {
                      isConcentration = value;
                    });
                  },
                  activeTrackColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 15, 60, 55),
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final String courseName = text.text ;
                        final newCourse = Course(
                          name: courseName,
                          credits: selectedCredit,
                          grade: selectedGrade,
                        );
                        Navigator.pop(context, newCourse);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Añadir Curso",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
