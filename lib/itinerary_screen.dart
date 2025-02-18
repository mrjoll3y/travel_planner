import 'package:flutter/material.dart';

// This screen allows users to add and view their trip itinerary, including destinations, hotels, activities, dates, and budget.
class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

// State class for the ItineraryScreen
class _ItineraryScreenState extends State<ItineraryScreen> {
  final TextEditingController _tripController = TextEditingController(); // Controller for trip destination
  final TextEditingController _hotelController = TextEditingController(); // Controller for hotel name
  final TextEditingController _activityController = TextEditingController(); // Controller for activity
  final TextEditingController _dateController = TextEditingController(); // Controller for dates
  final TextEditingController _budgetController = TextEditingController(); // Controller for budget
  List<Map<String, String>> trips = [];  // List to store trip details (destination, hotel, activity, etc.)

  // Function to add a trip with all details
  void _addTrip() {
    if (_tripController.text.isNotEmpty &&
        _hotelController.text.isNotEmpty &&
        _activityController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _budgetController.text.isNotEmpty) {
      setState(() {
        // Add a new trip with all entered details
        trips.add({
          'destination': _tripController.text,
          'hotel': _hotelController.text,
          'activity': _activityController.text,
          'dates': _dateController.text,
          'budget': _budgetController.text,
        });
        // Clear the input fields
        _tripController.clear();
        _hotelController.clear();
        _activityController.clear();
        _dateController.clear();
        _budgetController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a default layout structure (app bar, body, etc.)
      appBar: AppBar(title: Text("Itinerary")),  // App bar title
      body: Padding(
        padding: EdgeInsets.all(16.0),  // Add padding around the content
        child: Column(  // Column to arrange widgets vertically
          children: [
            // TextField for the trip destination
            TextField(
              controller: _tripController,
              decoration: InputDecoration(labelText: "Enter Destination"),
            ),
            // TextField for the hotel name
            TextField(
              controller: _hotelController,
              decoration: InputDecoration(labelText: "Enter Hotel Name"),
            ),
            // TextField for activity name
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: "Enter Activity"),
            ),
            // TextField for dates
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: "Enter Dates"),
            ),
            // TextField for budget
            TextField(
              controller: _budgetController,
              decoration: InputDecoration(labelText: "Enter Budget"),
            ),
            SizedBox(height: 20),  // Adds space between the fields and the button
            ElevatedButton(
              onPressed: _addTrip,  // Call _addTrip to add the trip details to the list
              child: Text("Add Trip"),
            ),
            SizedBox(height: 20),  // Adds space between the button and the list of trips
            Expanded(  // Allows the list to expand and fill available space
              child: ListView.builder(
                itemCount: trips.length,  // Number of items in the list
                itemBuilder: (context, index) {
                  // Display each trip as a list item
                  return Card(  // Use a Card widget for a nicer appearance
                    margin: EdgeInsets.symmetric(vertical: 10),  // Adds vertical margin
                    elevation: 5,  // Adds shadow to the card
                    child: Padding(
                      padding: EdgeInsets.all(10.0),  // Padding inside the card
                      child: Column(  // Use a column to display all trip details
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Destination: ${trips[index]['destination']}", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Hotel: ${trips[index]['hotel']}"),
                          Text("Activity: ${trips[index]['activity']}"),
                          Text("Dates: ${trips[index]['dates']}"),
                          Text("Budget: ${trips[index]['budget']}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
