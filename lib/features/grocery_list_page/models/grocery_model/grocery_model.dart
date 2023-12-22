import 'package:freezed_annotation/freezed_annotation.dart';

part 'grocery_model.freezed.dart';
part 'grocery_model.g.dart';

@freezed
class GroceryModel with _$GroceryModel {
  const factory GroceryModel({
    required String groceryName,
    required bool isChecked,
    required dynamic key,
  }) = _GroceryModel;

  factory GroceryModel.fromJson(Map<String, dynamic> json) =>
      _$GroceryModelFromJson(json);
}
