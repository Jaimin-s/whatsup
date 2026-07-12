import 'package:whatsup/features/status/domain/entity/status.dart';

abstract class StatusRepository {
  Future<void> addStatus(Status status);
  Future<List<Status>> getStatuses();
  Future<void> deleteStatus(String statusId);
}
