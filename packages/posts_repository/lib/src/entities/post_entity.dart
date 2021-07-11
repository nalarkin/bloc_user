// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({
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

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'idFrom': idFrom,
      'idTo': idTo,
      'content': content,
      'read': read,
      'date': date,
    };
  }

  @override
  List<Object> get props =>
      [read, id, idFrom, idTo, date, content];

  @override
  String toString() {
    return '''PostEntity { id: $id, idFrom: $idFrom idTo: $idTo, 
            read: $read, date: $date, content: $content}''';
  }

  static PostEntity fromJson(Map<String, Object> json) {
    return PostEntity(
      id: json['id'] as String,
      idFrom: json['idFrom'] as String,
      idTo: json['idTo'] as String,
      content: json['content'] as String,
      date: json['date'] as Timestamp,
      read: json['read'] as bool,
      
    );
  }

  static PostEntity fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>?;
    if (data == null) throw Exception();
    return PostEntity(
      id: data['id'] as String,
      idFrom: data['idFrom'] as String,
      idTo: data['idTo'] as String,
      content: data['content'] as String,
      date: data['date'] as Timestamp,
      read: data['read'] as bool,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'idFrom': idFrom,
      'idTo': idTo,
      'content': content,
      'read': read,
      'date': date,
    };
  }
}
