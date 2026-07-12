import 'package:flutter/material.dart';
import 'package:whatsup/features/chat/presentation/screens/select_user_screen.dart';
import 'package:whatsup/features/chat/services/chat_service.dart';

class Newchat extends StatefulWidget {
  const Newchat({super.key});

  @override
  State<Newchat> createState() => _NewchatState();
}

class _NewchatState extends State<Newchat> {
  final ChatService _chatservice = ChatService();
  late Future<List<dynamic>?> _futurecontacts;

  @override
  void initState() {
    super.initState();
    _futurecontacts = _chatservice.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<dynamic>?>(
          future: _futurecontacts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Text('$snapshot.error');
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No users found"));
            }

            final contacts = snapshot.data!;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact['username'] ?? 'unknown'),
                  subtitle: Text(contact['phoneNumber'] ?? ''),
                  onTap: () {
                    // Handle contact selection
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectUserScreen(),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
