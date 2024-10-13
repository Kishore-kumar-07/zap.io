import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: TicketData(),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'VIP Access',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ),
            const Icon(
              Icons.event_seat,
              color: Colors.pink,
              size: 30,
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Event Ticket',
            style: TextStyle(
                color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget('Event', 'Flutter DevFest', 'Date', '15-10-2024'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                child: ticketDetailsWidget('Time', '10:00 AM', 'Location', 'Tech Park, NY'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget('No. of Tickets', '3', 'Tier', 'Gold'),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
          child: Divider(
            color: Colors.black,
            thickness: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Text(
            'Ticket ID: 1234-5678-9101',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Text(
            'Contact: +1-123-456-7890',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        const Spacer(),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Powered by Flutter Events',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc, String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ],
        ),
      )
    ],
  );
}
