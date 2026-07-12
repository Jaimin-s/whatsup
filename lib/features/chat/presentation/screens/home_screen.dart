import 'package:flutter/material.dart';
import 'package:whatsup/features/chat/presentation/screens/chatsTab.dart';
import 'package:whatsup/features/chat/presentation/screens/newChat.dart';
import 'package:whatsup/features/status/presentation/screens/status_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,

        //  AppBar
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          elevation: 0,
          title: const Text(
            "Whatsup",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
          actions: const [
            Icon(Icons.camera_alt, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.more_vert, color: Colors.white),
            SizedBox(width: 16),
          ],

          bottom: const TabBar(
            indicatorColor: Colors.white,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 203, 203, 203),
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            ),
            tabs: [
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),

        // 📑 Tabs Content
        body: const TabBarView(children: [ChatsTab(), StatusTab(), CallsTab()]),

        // Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Newchat()),
            );
          },
          child: const Icon(Icons.chat, color: Colors.white),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 📞 CALLS TAB
//////////////////////////////////////////////////////////////

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
          ),
          title: Text("Jane Smith"),
          subtitle: Text("Yesterday, 9:45 PM"),
          trailing: Icon(Icons.call, color: Color(0xFF25D366)),
        );
      },
    );
  }
}
