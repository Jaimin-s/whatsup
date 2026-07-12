import 'package:flutter/material.dart';

class StatusTab extends StatefulWidget {
  const StatusTab({super.key});

  @override
  State<StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text("My Status"),
          subtitle: Text("Tap to add status update"),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: Text("Recent updates", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
