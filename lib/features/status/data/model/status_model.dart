import 'package:whatsup/features/status/domain/entity/status.dart';

class StatusModel {
  final String id;
  final String mediaurl;
  final DateTime timestamp;

  StatusModel({
    required this.id,
    required this.mediaurl,
    required this.timestamp,
  });

  factory StatusModel.fromEntity(Status status) {
    return StatusModel(
      id: status.id,
      mediaurl: status.mediaurl,
      timestamp: status.timestamp,
    );
  }

  Status toEntity() {
    return Status(id: id, mediaurl: mediaurl, timestamp: timestamp);
  }
}
