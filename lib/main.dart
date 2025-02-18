import 'package:flutter/material.dart';
import 'itinerary_screen.dart';  // Import the ItineraryScreen to navigate to it

// The main entry point for the app
void main() {
  runApp(TravelPlannerApp());
}

// This is the root widget of the app, which sets up the theme and initial screen
class TravelPlannerApp extends StatelessWidget {
  const TravelPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Disable the debug banner in the top right corner
      title: 'Travel Planner',  // Title of the app, shown in the taskbar or app launcher
      theme: ThemeData(primarySwatch: Colors.blue),  // Set the primary color for the app theme
      home: HomeScreen(),  // Set the initial screen to the HomeScreen
    );
  }
}

// This is the home screen of the app where the user starts
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a default layout structure (app bar, body, etc.)
      appBar: AppBar(title: Text("Travel Planner")),  // The top app bar with a title
      body: Center(  // Center widget to center all children inside the body
        child: Column(  // Column to arrange widgets vertically
          mainAxisAlignment: MainAxisAlignment.center,  // Center the children vertically
          children: [
            Text("Welcome to Travel Planner!", style: TextStyle(fontSize: 20)),  // Welcome text
            SizedBox(height: 20),  // Adds some space between the text and button
            ElevatedButton(
              onPressed: () {
                // Navigate to the ItineraryScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItineraryScreen()),  // Push the new screen onto the stack
                );
              },
              child: Text("Go to Itinerary"),  // Button text
            ),
          ],
        ),
      ),
    );
  }
}
