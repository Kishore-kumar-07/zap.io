import 'package:event_management/pages/user/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int ticketCount = 0;
  double ticketPrice = 0;
  String selectedTier = "";
  bool paymentConfirmed = false;
  DateTime? selectedDate;
  String selectedTimeSlot = "";

   
  final List<String> timeSlots = ["10:00 AM", "12:00 PM", "03:00 PM", "05:00 PM"];

  void showBookingDialog(BuildContext context, String tier, double price) {
    final TextEditingController ticketController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF1C1C1C),
              title: Text(
                "Book Tickets for $tier Tier",
                style: const TextStyle(color:  Colors.green),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Enter the number of tickets:",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextField(
                    controller: ticketController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Number of tickets",
                      hintStyle: TextStyle(color: Colors.white38),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:  Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:  Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                   
                  const Text(
                    "Select Date:",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: ColorScheme.dark(
                                primary:  Colors.green,
                                onPrimary: Colors.black,
                                surface: Colors.black,
                                onSurface: Colors.white,
                              ),
                              dialogBackgroundColor: const Color(0xFF1C1C1C),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color:   Colors.green),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate == null
                                ? "Select Date"
                                : DateFormat("dd-MM-yyyy").format(selectedDate!),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(Icons.calendar_today, color:  Colors.green),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                   
                  const Text(
                    "Select Time Slot:",
                    style: TextStyle(color: Colors.white70),
                  ),
                  DropdownButton<String>(
                    value: selectedTimeSlot.isEmpty ? null : selectedTimeSlot,
                    hint: const Text(
                      "Select Time",
                      style: TextStyle(color: Colors.white38),
                    ),
                    dropdownColor: const Color(0xFF1C1C1C),
                    items: timeSlots.map((slot) {
                      return DropdownMenuItem(
                        value: slot,
                        child: Text(
                          slot,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTimeSlot = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    "Book",
                    style: TextStyle(color:  Colors.green),
                  ),
                  onPressed: () {
                    setState(() {
                      ticketCount = int.tryParse(ticketController.text) ?? 0;
                      ticketPrice = price;
                      selectedTier = tier;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    double totalPrice = ticketCount * ticketPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Page',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: const Color(0xFF101010),
      ),
      backgroundColor: const Color(0xFF101010),
      body: Column(
        children: [
           
          Expanded(
            child: Center(
              child: Container(
                height: h * 0.5,
                width: w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                     
                    GestureDetector(
                      onTap: () {
                        showBookingDialog(context, "Silver", 300);
                      },
                      child: Container(
                        height: h * .6,
                        width: w * 0.95,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B2B2B),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Silver Tier",
                              style: TextStyle(
                                fontSize: 24,
                                color:  Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     
                    GestureDetector(
                      onTap: () {
                        showBookingDialog(context, "Gold", 500);
                      },
                      child: Container(
                        height: h * .3,
                        width: w * 0.75,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color:   Colors.green, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Gold Tier",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     
                    GestureDetector(
                      onTap: () {
                        showBookingDialog(context, "Platinum", 1000);
                      },
                      child: Container(
                        height: h * .2,
                        width: w * 0.5,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4D4D4D), Color(0xFF101010)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color:   Colors.green, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Platinum Tier",
                              style: TextStyle(
                                fontSize: 20,
                                color:  Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     
                    Container(
                      height: h * .1,
                      width: w * .3,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(11),
                          bottomRight: Radius.circular(11),
                        ),
                        color: const Color(0xFF282828),
                      ),
                      child: const Center(
                        child: Text(
                          "Stage",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: w,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.8),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color:   Colors.green, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selected Tier: $selectedTier",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "Tickets: $ticketCount",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "Date: ${selectedDate != null ? DateFormat('dd-MM-yyyy').format(selectedDate!) : "Not selected"}",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "Time Slot: $selectedTimeSlot",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "Total Amount: ₹$totalPrice",
                          style: const TextStyle(color:  Colors.green, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 10),
                    child: SlideAction(
                      text: "Swipe to Confirm Payment",
                      textStyle: const TextStyle(color: Colors.white),
                      outerColor:   Colors.green,
                      innerColor: const Color(0xFF282828),
                      onSubmit: () {
                        setState(() {
                          paymentConfirmed = true;
                        });
                        Future.delayed(
                          const Duration(milliseconds: 500),
                              () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Payment of ₹$totalPrice confirmed for $selectedTier Tier!",
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor:   Colors.green,
                            ),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TicketPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
