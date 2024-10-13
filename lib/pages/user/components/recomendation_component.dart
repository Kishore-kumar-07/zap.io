import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import '../event_details_page.dart';

class RecommendationComponent extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String time;
  final String date;
  final int idx;

  const RecommendationComponent({
    Key? key,
    required this.imageUrl,
    required this.location,
    required this.time,
    required this.date, required this.idx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Hero(
        tag: idx,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/aadhina.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft
              ),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
      Positioned(
          bottom: 0,
          child: Container(
            height: 95,
            width: MediaQuery.of(context).size.width * .95,
            decoration: BoxDecoration(
              color:
                  Colors.green.withOpacity(0.9),
              borderRadius:
                  BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  10),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 0, sigmaY: 0),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  location,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  time,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  date,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                SizedBox(height: 8),
                              ]),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsPage(img: imageUrl,idx:idx)));
                          }, child:Text("Book Now",style: TextStyle(color: Colors.green),)),
                        )
                      ],
                    )),
              ),
            ),
          )),
    ]);
  }
}
