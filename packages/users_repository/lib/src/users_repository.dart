import 'dart:async';

import '../users_repository.dart';

abstract class UsersRepository {
  Future<void> addNewUser(FirestoreUser user);

  Future<void> deleteUser(FirestoreUser user);

  Stream<List<FirestoreUser>> users();

  Future<void> updateUser(FirestoreUser user);
}
