import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'meta.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  int? code;
  bool? success;
  int? timestamp;
  String? message;
  List<Item> items;
  Meta? meta;

  Todo({
    this.code,
    this.success,
    this.timestamp,
    this.message,
    required this.items,
    this.meta,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
