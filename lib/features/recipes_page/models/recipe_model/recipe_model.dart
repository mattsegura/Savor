import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required dynamic key,
    required String host,
    required String title,
    // ignore: non_constant_identifier_names
    required int total_time,
    required String image,
    required List<String> ingredients,
    required String instructions,
    required Nutrients nutrients,
    required String servings,
    @JsonKey(defaultValue: '') required String addTime,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class Nutrients with _$Nutrients {
  const factory Nutrients({
    @HiveField(0) required String? calories,
    @HiveField(1) required String? carbohydrateContent,
    @HiveField(2) required String? proteinContent,
    @HiveField(3) required String? fatContent,
    @HiveField(4) required String? saturatedFatContent,
    @HiveField(5) required String? sodiumContent,
    @HiveField(6) required String? fiberContent,
    @HiveField(7) required String? sugarContent,
    @HiveField(8) required String? servingSize,
  }) = _Nutrients;

  factory Nutrients.fromJson(Map<String, dynamic> json) =>
      _$NutrientsFromJson(json);
}
