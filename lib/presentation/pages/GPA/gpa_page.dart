import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/widgets/gpa_card.dart';
import 'package:classic_gpa/presentation/pages/GPA/gpa_class.dart';
import 'package:go_router/go_router.dart';

class GpaPage extends StatefulWidget {
  const GpaPage({super.key});

  @override
  State<GpaPage> createState() => _GpaPageState();
}

class _GpaPageState extends State<GpaPage> {
  List<int> years = List.generate(6, (index) => index + 1);
  int nextYear = 7;
  final ScrollController pageScroller = ScrollController();

  void addCard() {
    setState(() {
      years.add(nextYear);
      nextYear++;
    });
  }

  void deleteCard(int yearToDelete) {
    setState(() {
      years.remove(yearToDelete);
    });
  }

  @override
  void dispose() {
    pageScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: pageScroller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    }
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
                    'Calculadora de Notas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: (){
                      context.push('/gpa/class');
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 40,
                  ),
                )
              ],
              floating: true,
              snap: true,
              pinned: false,
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: years.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 4, 10, 12),
                      child: Container(
                        height: 90,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'General',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '0.00',
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 18, 12),
                      child: Container(
                        height: 90,
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
                              'Concentracion',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '0.00',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            final int currentYearIndex = i - 1; 
            final int currentYear = years[currentYearIndex];
            return GpaPlusWidget(
              key: ValueKey(currentYear),
              yearNumber: currentYear,
              onDelete: (int yearToDelete) {
                deleteCard(yearToDelete);
              },
            );
          },
        ),
      ),
    );
  }
}
