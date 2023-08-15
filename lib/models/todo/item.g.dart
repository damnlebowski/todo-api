// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
