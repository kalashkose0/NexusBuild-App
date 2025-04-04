import 'package:flutter/material.dart';

class CivilEngineer extends StatelessWidget {
  const CivilEngineer({super.key});

  final List<Map<String, dynamic>> workers = const [
    {"name": "Ramesh", "location": "Delhi", "available": true},
    {"name": "Suresh", "location": "Mumbai", "available": false},
    {"name": "Mahesh", "location": "Lucknow", "available": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Image.asset(
              'assets/images/tower.png',
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'NexusBuild',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'उपलब्ध मिस्त्री / Available Workers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(worker['name'][0]),
                      ),
                      title: Text(worker['name']),
                      subtitle: Text('स्थान: ${worker['location']}'),
                      trailing: worker['available']
                          ? ElevatedButton(
                              onPressed: () {
                                // Add chat or call feature here
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Chat with ${worker['name']}")),
                                );
                              },
                              child: Text('संपर्क करें'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                            )
                          : Text(
                              'उपलब्ध नहीं',
                              style: TextStyle(color: Colors.red),
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
