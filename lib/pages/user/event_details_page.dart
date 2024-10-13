import 'package:flutter/material.dart';

import 'booking_page.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({
    super.key,
    required this.img,
    required this.idx,
  });

  final String img;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Concert Details",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
        
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Hero(
              tag: idx,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            "Adhi's World Tour",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10),

           
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.green),
              const SizedBox(width: 8),
              const Text(
                "Chennai, India",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.green),
              const SizedBox(width: 8),
              const Text(
                "6:00 PM, Dec 15, 2024",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

  
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Event Description",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Adhi of Hip Hop Tamizha is set to embark on a thrilling world tour, bringing his signature blend of Tamil folk and hip-hop to global fans. Get ready for energetic performances of chart-toppers like \"Vaadi Pulla Vaadi\" and \"Takkaru Takkaru.\"",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()));
                      },
                      icon: const Icon(Icons.airplane_ticket),
                      label: const Text("Buy Tickets"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () {
                       
                      },
                      icon: const Icon(Icons.share),
                      label: const Text("Share"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green, side: const BorderSide(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
