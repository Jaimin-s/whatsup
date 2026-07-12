import 'package:flutter/material.dart';
import 'package:whatsup/features/chat/data/models/chatModel.dart';
import 'package:whatsup/features/chat/services/chat_service.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({super.key});

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  final ChatService _chatService = ChatService();
  late Future<List<Chat>> _chatsFuture;

  @override
  void initState() {
    super.initState();
    _chatsFuture = _chatService.getChats();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _chatsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Failed to load chats:\n${snapshot.error}'),
            ),
          );
        }

        final chats = snapshot.data ?? [];

        if (chats.isEmpty) {
          return Center(child: Text('No chats yet'));
        }

        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return ChatTile(
              contactname: chat.contactname,
              lastmessage: chat.lastmessage,
            );
          },
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  final String contactname;
  final String lastmessage;

  const ChatTile({
    super.key,
    required this.contactname,
    required this.lastmessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
      ),
      title: Text(contactname, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(lastmessage, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("12:30", style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 5),
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFF25D366),
            child: Text(
              "2",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
