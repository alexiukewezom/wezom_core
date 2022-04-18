import 'dart:convert';

import 'db.core.dart';

class DBState2 {
  List<BaseDB> databases;
  DBState2({this.databases = const []});

  DBState2 copyWith({
    List<BaseDB>? databases,
  }) {
    return DBState2(
      databases: databases ?? this.databases,
    );
  }
}

class DataObject {
  final DateTime dateTime;
  final dynamic data;
  DataObject({
    required this.dateTime,
    required this.data,
  });

  DataObject copyWith({
    DateTime? dateTime,
    dynamic data,
  }) {
    return DataObject(
      dateTime: dateTime ?? this.dateTime,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'data': data,
    };
  }

  factory DataObject.fromMap(Map<String, dynamic> map) {
    return DataObject(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataObject.fromJson(String source) =>
      DataObject.fromMap(json.decode(source));

  @override
  String toString() => 'DataObject(dateTime: $dateTime, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataObject &&
        other.dateTime == dateTime &&
        other.data == data;
  }

  @override
  int get hashCode => dateTime.hashCode ^ data.hashCode;
}

// abstract class BaseModel {
//   static fromMap(Map<String, dynamic> map) => throw UnimplementedError();
//   Map<String, dynamic> toMap() => {};
// }

