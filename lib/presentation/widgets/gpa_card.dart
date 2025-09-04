import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/widgets/semester_card.dart';

class GpaPlusWidget extends StatefulWidget {
  final int yearNumber;
  final void Function(int yearNumber) onDelete;


  const GpaPlusWidget({
    super.key,
    required this.yearNumber,
    required this.onDelete,

  });

  @override
  State<GpaPlusWidget> createState() => _GpaPlusWidgetState();
}

class _GpaPlusWidgetState extends State<GpaPlusWidget> {
  bool expanded = false;
  double gpaNUM = 0.0;

  @override
  void initState() {
    super.initState();

    double baseValue = 0.45 - (5.0 / 9.0);
    gpaNUM = baseValue + (widget.yearNumber - 1) * (5.0 / 9.0);
  }

  @override
  Widget build(BuildContext context) {
    double displayedGpa = gpaNUM + (5.0 / 9.0);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        width: double.infinity,
        height: expanded ? 620 : 220,
        duration: const Duration(milliseconds: 100),
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
                    style: TextStyle(
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
                        onPressed: () {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) => CupertinoActionSheet(
                              title: const Text('Options'),
                              actions: [
                                CupertinoActionSheetAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    widget.onDelete(widget.yearNumber);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Delete Card'),
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.more_horiz_outlined),
                        iconSize: 30,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.grey[350]),
                        ),
                      ),
                    ),
                    if (!expanded)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Text(
                                  "GPA:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  displayedGpa.toStringAsFixed(2), 
                                  style: const TextStyle(
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
            if (expanded)
              Positioned(
                left: 16,
                right: 16,
                bottom: 60,
                child: Column(
                  children: [
                    SemesterCard(
                      title: 'Primer Semestre',
                      gpa: "0.00",
                    ),
                    const SizedBox(height: 16),
                    SemesterCard(
                      title: 'Segundo Semestre',
                      gpa: "0.00", 
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {
                  setState(() => expanded = !expanded);
                },
                icon: AnimatedRotation(
                  duration: const Duration(milliseconds: 1),
                  turns: expanded ? 0.5 : 0.0,
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