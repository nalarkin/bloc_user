import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../posts_repository.dart';

class FirestorePost extends Equatable {
  const FirestorePost({
    required this.id,
    required this.idFrom,
    required this.idTo,
    required this.content,
    required this.date,
    required this.read,
  });

  final String id;
  final String idFrom;
  final String idTo;
  final String content;
  final bool read;
  final Timestamp date;

  FirestorePost copyWith(
      {String? id,
      String? idFrom,
      String? idTo,
      String? content,
      bool? read,
      Timestamp? date}) {
    return FirestorePost(
      id: id ?? this.id,
      idFrom: idFrom ?? this.idFrom,
      idTo: idTo ?? this.idTo,
      read: read ?? this.read,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }

  @override
  List<Object> get props =>
      [read, id, idFrom, idTo, date, content];

  @override
  String toString() {
    return '''FirestorePost { id: $id, idFrom: $idFrom idTo: $idTo, 
            read: $read, date: $date, content: $content}''';
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      idFrom: idFrom,
      idTo: idTo,
      read: read,
      date: date,
      content: content,
    );
  }

  static FirestorePost fromEntity(PostEntity entity) {
    return FirestorePost(
      id: entity.id,
      idFrom: entity.idFrom,
      idTo: entity.idTo,
      read: entity.read,
      date: entity.date,
      content: entity.content,
    );
  }
}
