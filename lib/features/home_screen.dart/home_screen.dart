// import 'package:chat_app/features/home_screen.dart/home/home_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text(
//           "Logo",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               radius: 25,
//               backgroundImage: AssetImage("assets/images/well.png"),
//             ),
//           )
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: 15,
//           itemBuilder: (contex, index) {
//             return ListTile(
//               leading: CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage("assets/images/well.png"),
//               ),
//               title: Text('data'),
//             );
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      "name": "Neymar",
      "message": "Hey! How's it going?",
      "time": "10:45 AM",
      "image": "assets/images/2.webp" // Replace with a real image URL
    },
    {
      "name": "Ronaldinho Goucho ",
      "message": "Don't forget the meeting tomorrow.",
      "time": "9:30 AM",
      "image": "assets/images/5.webp"
    },
    {
      "name": "Zohaib Tkd",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/p2.jpg"
    },
    {
      "name": "Loinel Messi",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/1.webp"
    },
    {
      "name": "Cristano Ronaldo",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/7.webp"
    },
    {
      "name": "Kaliyen Mbappa",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/3.webp"
    },
    {
      "name": "Blender Guru",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/4.jpg"
    },
    {
      "name": "Neymar",
      "message": "Hey! How's it going?",
      "time": "10:45 AM",
      "image": "assets/images/2.webp" // Replace with a real image URL
    },
    {
      "name": "Ronaldinho Goucho ",
      "message": "Don't forget the meeting tomorrow.",
      "time": "9:30 AM",
      "image": "assets/images/5.webp"
    },
    {
      "name": "Zohaib Tkd",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/p2.jpg"
    },
    {
      "name": "Loinel Messi",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/1.webp"
    },
    {
      "name": "Cristano Ronaldo",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/7.webp"
    },
    {
      "name": "Kaliyen Mbappa",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/3.webp"
    },
    {
      "name": "Blender Guru",
      "message": "Check out the new Flutter 3.0 features!",
      "time": "Yesterday",
      "image": "assets/images/4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.abc),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          chats[index]["image"]!,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    title: Text(chats[index]["name"]!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(chats[index]["message"]!),
                    trailing: Text(
                      chats[index]["time"]!,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    onTap: () {
                      // Handle chat click
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for new chat
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.favorite),
      ),
    );
  }
}
