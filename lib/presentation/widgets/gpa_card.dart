import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/widgets/semester_card.dart';

class GpaPlusWidget extends StatefulWidget {
  final int yearNumber;

  const GpaPlusWidget({super.key, required this.yearNumber});

  @override
  State<GpaPlusWidget> createState() => _GpaPlusWidgetState();
}

class _GpaPlusWidgetState extends State<GpaPlusWidget> {
  bool _expanded = false; // <-- added

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        width: double.infinity,
        height: _expanded ? 420 : 220,
        duration:  Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 23, 10, 10),
                  child: Text(
                    'Año ${widget.yearNumber}',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined),
                        iconSize: 30,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.grey[350]),
                        ),
                      ),
                    ),

                    if (!_expanded)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "GPA:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "0.00",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),


            if (_expanded)
              Positioned(
                left: 16,
                right: 16,
                bottom: 60, // space for the arrow
                child: Column(
                  children: [
                    SemesterCard(
                      title: 'Primer Semestre',
                      gpa: 0.00,
                    ),
                    const SizedBox(height: 12),
                    SemesterCard(
                      title: 'Segundo Semestre',
                      gpa: 0.00,
                    ),
                  ],
                ),
              ), // Comma added here
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {
                  setState(() => _expanded = !_expanded); // <-- toggle
                },
                icon: AnimatedRotation( // nice arrow rotation (optional)
                  duration: const Duration(milliseconds: 1),
                  turns: _expanded ? 0.5 : 0.0,
                  child: const Icon(
                    Icons.expand_more_outlined,
                    size: 45,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all(Colors.grey[350]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}