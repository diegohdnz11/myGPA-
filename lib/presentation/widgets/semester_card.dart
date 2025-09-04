import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SemesterCard extends StatelessWidget {
  const SemesterCard({ super.key,

    required this.title,
    required this.gpa,

  });

  final String title;
  final String gpa;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      letterSpacing: .2,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("CURSO"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("CREDITOS"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("NOTA"),
                          ),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.0, 8.0, 8, 8.0),
                            child: Text("diego"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 8.0),
                            child: Text("1"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 15, 8.0),
                            child: Text("A"),
                          ),
                        ]
                      ),
                    ]
                  ),

              ),
            ), 
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'GPA: 0.00',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w800,
                      letterSpacing: .2,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){
                    context.push('/gpa/class');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  ),
                  child:  Text('Añadir',
                      style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green[700]),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
