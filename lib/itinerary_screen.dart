import 'package:flutter/material.dart';

// This screen allows users to add and view their trip itinerary
class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

// State class for the ItineraryScreen
class _ItineraryScreenState extends State<ItineraryScreen> {
  final TextEditingController _tripController = TextEditingController();  // Controller to manage the text input
  List<String> trips = [];  // List to store the trips added by the user

  // Function to add a trip to the list
  void _addTrip() {
    if (_tripController.text.isNotEmpty) {
      setState(() {
        // Add the entered trip to the trips list and clear the input field
        trips.add(_tripController.text);
        _tripController.clear();  // Clear the text input field after adding
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a default layout structure (app bar, body, etc.)
      appBar: AppBar(title: Text("Itinerary")),  // The top app bar with a title
      body: Padding(
        padding: EdgeInsets.all(16.0),  // Add padding around the content
        child: Column(  // Column to arrange widgets vertically
          children: [
            TextField(
              controller: _tripController,  // Controller for the input field
              decoration: InputDecoration(labelText: "Enter Destination"),  // Label for the input field
            ),
            SizedBox(height: 10),  // Adds some space between the input field and button
            ElevatedButton(
              onPressed: _addTrip,  // Call _addTrip when the button is pressed
              child: Text("Add Trip"),  // Button text
            ),
            SizedBox(height: 20),  // Adds some space between the button and the list of trips
            Expanded(  // Allows the list to expand and fill available space
              child: ListView.builder(
                itemCount: trips.length,  // The number of items in the list
                itemBuilder: (context, index) {
                  return ListTile(  // Display each trip as a list item
                    leading: Icon(Icons.location_on),  // Icon next to each trip
                    title: Text(trips[index]),  // Display the trip name
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
