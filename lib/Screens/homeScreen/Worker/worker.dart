import 'package:flutter/material.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  bool _isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Image.asset(
              'assets/images/tower.png', // Your logo path
              height: 32,
            ),
            SizedBox(width: 10),
            Text(
              'Nexus Build',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: Colors.amber),
                  ),
                  SizedBox(height: 10),
                  Text('Hello, Worker', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {},
            ),
          ],
        ),
      ),

      // Body Content
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Availability Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'काम के लिए उपलब्ध हूँ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeColor: const Color.fromARGB(255, 8, 248, 16),
                  activeTrackColor: Colors.amber,
                  value: _isAvailable,
                  onChanged: (value) {
                    setState(() {
                      _isAvailable = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),

            // Location Section
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.amber),
                SizedBox(width: 10),
                Text(
                  'स्थान: लखनऊ, उत्तर प्रदेश',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Work Time
            Row(
              children: [
                Icon(Icons.access_time_filled, color: Colors.amber),
                SizedBox(width: 10),
                Text(
                  'समय: सुबह 9 बजे - शाम 6 बजे',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Work Date
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.amber),
                SizedBox(width: 10),
                Text(
                  'तिथि: 5 अप्रैल 2025',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Availability Info Box
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: _isAvailable ? Colors.amber[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    _isAvailable ? Icons.check_circle : Icons.cancel,
                    color: _isAvailable ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _isAvailable
                          ? 'आप अभी काम के लिए उपलब्ध हैं।'
                          : 'आपने "उपलब्ध नहीं हूँ" सेट किया है।',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
