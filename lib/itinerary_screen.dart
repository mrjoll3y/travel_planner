import 'package:flutter/material.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _hotelController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  List<Map<String, String>> trips = [];

  void _addTrip() {
    if (_destinationController.text.isNotEmpty &&
        _hotelController.text.isNotEmpty &&
        _activityController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _budgetController.text.isNotEmpty) {
      setState(() {
        trips.add({
          'destination': _destinationController.text,
          'hotel': _hotelController.text,
          'activity': _activityController.text,
          'date': _dateController.text,
          'budget': _budgetController.text,
        });
        _destinationController.clear();
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
      appBar: AppBar(title: Text("Itinerary")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(labelText: "Enter Destination"),
            ),
            TextField(
              controller: _hotelController,
              decoration: InputDecoration(labelText: "Enter Hotel"),
            ),
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: "Enter Activity"),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: "Enter Dates"),
            ),
            TextField(
              controller: _budgetController,
              decoration: InputDecoration(labelText: "Enter Budget"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTrip,
              child: Text("Add Trip"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(trips[index]['destination'] ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hotel: ${trips[index]['hotel'] ?? ''}'),
                          Text('Activity: ${trips[index]['activity'] ?? ''}'),
                          Text('Date: ${trips[index]['date'] ?? ''}'),
                          Text('Budget: \$${trips[index]['budget'] ?? ''}'),
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
