import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(name: 'total_items')
  int? totalItems;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'per_page_item')
  int? perPageItem;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'has_more_page')
  bool? hasMorePage;

  Meta({
    this.totalItems,
    this.totalPages,
    this.perPageItem,
    this.currentPage,
    this.pageSize,
    this.hasMorePage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
