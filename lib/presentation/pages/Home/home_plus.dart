import 'package:flutter/material.dart';

class HomePlus extends StatefulWidget {
  const HomePlus({super.key});

  @override
  State<HomePlus> createState() => _HomePlusState();
}

class _HomePlusState extends State<HomePlus> {
  final searchText = TextEditingController();



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
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 36,
          ),
        ),
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Añadir Curso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 20),
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
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextField(
                controller: searchText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 6.5,
                    ),
                  ),
                  hintText: 'Introduzca el nombre',
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 15, 60, 55),
              child: Row(children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if(searchText.text.isNotEmpty) {
                        Navigator.pop(context, searchText.text);
                      }
                    },
                    child: Text(
                      "Añadir",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
    );
  }
}