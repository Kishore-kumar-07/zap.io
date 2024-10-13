import 'package:event_management/pages/user/event_details_page.dart';
import 'package:flutter/material.dart';

class EventListComponent extends StatelessWidget {
  const EventListComponent({super.key, required this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 130,
            width: MediaQuery.of(context).size.width*.95,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(11)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade800,blurRadius: 10,offset: Offset(4, 4)),
                    BoxShadow(color: Colors.green.shade200.withOpacity(.5),blurRadius: 10,offset: Offset(-3,-3))
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: idx,
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(image: AssetImage("assets/images/aadhina.jpg"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(11)
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left:5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aadhi's World Tour Concert",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          Text("Coimbatore",style: TextStyle(color: Colors.black),),
                          Text("oct 10 , 2024",style: TextStyle(color: Colors.black)),
                          Text("10:00 Pm",style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5,bottom: 5),
                      child: Align(alignment:Alignment.bottomRight,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsPage(idx: idx, img: 'assets/images/aadhina.jpg',)));
                      }, child:Text("Book Now",style: TextStyle(color: Colors.green))),),
                    )
                  ],
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
