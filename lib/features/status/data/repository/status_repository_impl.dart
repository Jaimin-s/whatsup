import 'package:whatsup/features/status/domain/entity/status.dart';
import 'package:whatsup/features/status/domain/repository/status_repository.dart';

class StatusRepositoryImpl implements StatusRepository {
  @override
  Future<void> addStatus(Status status) async {}

  @override
  Future<List<Status>> getStatuses() async {
    return [];
  }

  @override
  Future<void> deleteStatus(String statusId) async {}
}
