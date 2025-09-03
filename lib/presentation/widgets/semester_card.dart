import 'package:classic_gpa/presentation/pages/GPA/gpa_class.dart';
import 'package:flutter/material.dart';

class SemesterCard extends StatelessWidget {
  const SemesterCard({ super.key,

    required this.title,
    required this.gpa,

  });

  final String title;
  final double gpa;

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GpaClass()));
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
