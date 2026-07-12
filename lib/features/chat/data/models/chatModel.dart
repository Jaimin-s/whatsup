class Chat {
  final String id;
  final String contactname;
  final String lastmessage;

  Chat({
    required this.id,
    required this.contactname,
    required this.lastmessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    final rawLastMessage = json['lastmessage'];
    String lastMessageText = '';

    if (rawLastMessage is Map<String, dynamic>) {
      lastMessageText = rawLastMessage['text']?.toString() ?? '';
    } else if (rawLastMessage != null) {
      lastMessageText = rawLastMessage.toString();
    }

    return Chat(
      id: json['_id']?.toString() ?? '',
      contactname: json['contactname']?.toString() ?? 'Unknown',
      lastmessage: lastMessageText,
    );
  }
}
