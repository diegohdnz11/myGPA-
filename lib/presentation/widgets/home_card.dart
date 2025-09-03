import 'package:classic_gpa/presentation/pages/GPA/gpa_page.dart';
import 'package:classic_gpa/presentation/pages/Home/home_insights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final String courseName;
  final VoidCallback onDelete;

  const HomeCard({
    super.key,
    required this.courseName,
    required this.onDelete,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  String normalPercent = "--%";
  final TextEditingController text = TextEditingController();

  Future<void> _showPercentageDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Grade'),
          content: TextField(
            controller: text,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Enter number"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
              onPressed: () {
                Navigator.of(context).pop();
                text.clear();
              },
            ),
            TextButton(
              child: const Text('OK',style: TextStyle(color: Colors.black54)),
              onPressed: () {
                setState(() {
                  normalPercent = "${text.text}%";
                });
                Navigator.of(context).pop();
                text.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeInsights(pageTitle: widget.courseName)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Stack(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 23, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.courseName,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 10, 10),
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
                                    widget.onDelete();
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
                          backgroundColor:
                              WidgetStateProperty.all(Colors.grey[300]),
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: _showPercentageDialog,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  shape: const CircleBorder(),
                                ),
                                child: Text(
                                  normalPercent,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ]),
      ),
    );
  }
}
