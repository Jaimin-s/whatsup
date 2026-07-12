import 'package:whatsup/core/network/base_client.dart';
import 'package:whatsup/features/chat/data/models/chatModel.dart';

class ChatService {
  final BaseClient _client = BaseClient();

  // fetch chats list
  Future<List<Chat>> getChats() async {
    try {
      final response = await _client.get('chats');
      print("RAW API RESPONSE: $response");

      if (response is List) {
        return response
            .map((json) => Chat.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      print('Error fetching chats: $e');
      rethrow;
    }
  }

  // create chats
  Future<dynamic> createChat(String receiverId) async {
    try {
      return await _client.post('chats', {'receiverId': receiverId});
    } catch (e) {
      print('Error creating chat: $e');
      return null;
    }
  }

  // getallusers
  Future<List<dynamic>?> getAllUsers() async {
    try {
      final response = await _client.get('users');

      if (response != null) {
        return response as List<dynamic>;
      }
    } catch (e) {
      print('error fetching contacts');
      return [];
    }
    return null;
  }
}
