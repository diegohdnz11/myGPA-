import 'package:classic_gpa/presentation/pages/GPA/gpa_page.dart';
import 'package:classic_gpa/presentation/pages/Home/home_insights.dart';
import 'package:flutter/material.dart';


class HomeWorkCard extends StatelessWidget {
  final String courseName;
  final String percentage; // Added percentage parameter

  const HomeWorkCard({super.key, required this.courseName, required this.percentage}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(onPressed: (){

      },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Stack(
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 23, 10, 10),
                      child: Text(
                        courseName,
                        style: const TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50,20, 10, 10),
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.more_horiz_outlined),
                            iconSize: 30,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 35, 35, 50),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "$percentage%", // Display dynamic percentage
                                    style: const TextStyle(fontSize: 20,color: Colors.black,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
              ),
            ]
        ),
      ),
    );
  }
}
