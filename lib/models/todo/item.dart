import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? description;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Item({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
