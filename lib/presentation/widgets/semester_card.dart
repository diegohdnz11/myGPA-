import 'package:flutter/material.dart';

class SemesterCard extends StatelessWidget {
  const SemesterCard({
    super.key,
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
        color: Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell( // Outer InkWell remains for ripple if desired, but onTap is removed
        // onTap: () {}, // Removed onTap to make it non-interactive for expansion
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title, // Corrected: Removed widget. prefix
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      letterSpacing: .2,
                    ),
                  ),
                ),
                // Removed expand/collapse icon
              ],
            ),

            // Removed conditionally displayed inner white card (course details)

            const SizedBox(height: 16), // Keep spacing

            // GPA pill + Add button (always visible)
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FAF0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'GPA: ${gpa.toStringAsFixed(2)}', // Corrected: Removed widget. prefix
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .2,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){}, // Corrected: Removed widget. prefix
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  ),
                  child: const Text('Añadir',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
