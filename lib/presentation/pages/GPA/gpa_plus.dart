import 'package:flutter/material.dart';

class GpaPlusWidget extends StatelessWidget {
  final int yearNumber;

  const GpaPlusWidget({super.key, required this.yearNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 220,
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
                  'Año $yearNumber',
                  style: const TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.more_horiz_outlined),
                        iconSize: 30,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.grey[350]),
                      ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey,width: 2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text("GPA:",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                                Text("0.00",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        ),
                  ],
                )
              ]
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.expand_more_outlined,size: 45,),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey[350]),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
