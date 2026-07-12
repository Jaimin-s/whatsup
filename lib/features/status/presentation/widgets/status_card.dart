import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text("My Status"),
      subtitle: Text("Tap to add status update"),
    );
  }
}
