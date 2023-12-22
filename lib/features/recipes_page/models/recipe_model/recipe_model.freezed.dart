// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) {
  return _RecipeModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeModel {
  dynamic get key => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get title =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  int get total_time => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  Nutrients get nutrients => throw _privateConstructorUsedError;
  String get servings => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get addTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeModelCopyWith<RecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeModelCopyWith<$Res> {
  factory $RecipeModelCopyWith(
          RecipeModel value, $Res Function(RecipeModel) then) =
      _$RecipeModelCopyWithImpl<$Res, RecipeModel>;
  @useResult
  $Res call(
      {dynamic key,
      String host,
      String title,
      int total_time,
      String image,
      List<String> ingredients,
      String instructions,
      Nutrients nutrients,
      String servings,
      @JsonKey(defaultValue: '') String addTime});

  $NutrientsCopyWith<$Res> get nutrients;
}

/// @nodoc
class _$RecipeModelCopyWithImpl<$Res, $Val extends RecipeModel>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? host = null,
    Object? title = null,
    Object? total_time = null,
    Object? image = null,
    Object? ingredients = null,
    Object? instructions = null,
    Object? nutrients = null,
    Object? servings = null,
    Object? addTime = null,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      total_time: null == total_time
          ? _value.total_time
          : total_time // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as String,
      addTime: null == addTime
          ? _value.addTime
          : addTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NutrientsCopyWith<$Res> get nutrients {
    return $NutrientsCopyWith<$Res>(_value.nutrients, (value) {
      return _then(_value.copyWith(nutrients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RecipeModelCopyWith<$Res>
    implements $RecipeModelCopyWith<$Res> {
  factory _$$_RecipeModelCopyWith(
          _$_RecipeModel value, $Res Function(_$_RecipeModel) then) =
      __$$_RecipeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic key,
      String host,
      String title,
      int total_time,
      String image,
      List<String> ingredients,
      String instructions,
      Nutrients nutrients,
      String servings,
      @JsonKey(defaultValue: '') String addTime});

  @override
  $NutrientsCopyWith<$Res> get nutrients;
}

/// @nodoc
class __$$_RecipeModelCopyWithImpl<$Res>
    extends _$RecipeModelCopyWithImpl<$Res, _$_RecipeModel>
    implements _$$_RecipeModelCopyWith<$Res> {
  __$$_RecipeModelCopyWithImpl(
      _$_RecipeModel _value, $Res Function(_$_RecipeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? host = null,
    Object? title = null,
    Object? total_time = null,
    Object? image = null,
    Object? ingredients = null,
    Object? instructions = null,
    Object? nutrients = null,
    Object? servings = null,
    Object? addTime = null,
  }) {
    return _then(_$_RecipeModel(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      total_time: null == total_time
          ? _value.total_time
          : total_time // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as String,
      addTime: null == addTime
          ? _value.addTime
          : addTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeModel implements _RecipeModel {
  const _$_RecipeModel(
      {required this.key,
      required this.host,
      required this.title,
      required this.total_time,
      required this.image,
      required final List<String> ingredients,
      required this.instructions,
      required this.nutrients,
      required this.servings,
      @JsonKey(defaultValue: '') required this.addTime})
      : _ingredients = ingredients;

  factory _$_RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeModelFromJson(json);

  @override
  final dynamic key;
  @override
  final String host;
  @override
  final String title;
// ignore: non_constant_identifier_names
  @override
  final int total_time;
  @override
  final String image;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String instructions;
  @override
  final Nutrients nutrients;
  @override
  final String servings;
  @override
  @JsonKey(defaultValue: '')
  final String addTime;

  @override
  String toString() {
    return 'RecipeModel(key: $key, host: $host, title: $title, total_time: $total_time, image: $image, ingredients: $ingredients, instructions: $instructions, nutrients: $nutrients, servings: $servings, addTime: $addTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeModel &&
            const DeepCollectionEquality().equals(other.key, key) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.total_time, total_time) ||
                other.total_time == total_time) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.nutrients, nutrients) ||
                other.nutrients == nutrients) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            (identical(other.addTime, addTime) || other.addTime == addTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      host,
      title,
      total_time,
      image,
      const DeepCollectionEquality().hash(_ingredients),
      instructions,
      nutrients,
      servings,
      addTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeModelCopyWith<_$_RecipeModel> get copyWith =>
      __$$_RecipeModelCopyWithImpl<_$_RecipeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeModelToJson(
      this,
    );
  }
}

abstract class _RecipeModel implements RecipeModel {
  const factory _RecipeModel(
          {required final dynamic key,
          required final String host,
          required final String title,
          required final int total_time,
          required final String image,
          required final List<String> ingredients,
          required final String instructions,
          required final Nutrients nutrients,
          required final String servings,
          @JsonKey(defaultValue: '') required final String addTime}) =
      _$_RecipeModel;

  factory _RecipeModel.fromJson(Map<String, dynamic> json) =
      _$_RecipeModel.fromJson;

  @override
  dynamic get key;
  @override
  String get host;
  @override
  String get title;
  @override // ignore: non_constant_identifier_names
  int get total_time;
  @override
  String get image;
  @override
  List<String> get ingredients;
  @override
  String get instructions;
  @override
  Nutrients get nutrients;
  @override
  String get servings;
  @override
  @JsonKey(defaultValue: '')
  String get addTime;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeModelCopyWith<_$_RecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Nutrients _$NutrientsFromJson(Map<String, dynamic> json) {
  return _Nutrients.fromJson(json);
}

/// @nodoc
mixin _$Nutrients {
  @HiveField(0)
  String? get calories => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get carbohydrateContent => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get proteinContent => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get fatContent => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get saturatedFatContent => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get sodiumContent => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get fiberContent => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get sugarContent => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get servingSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutrientsCopyWith<Nutrients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientsCopyWith<$Res> {
  factory $NutrientsCopyWith(Nutrients value, $Res Function(Nutrients) then) =
      _$NutrientsCopyWithImpl<$Res, Nutrients>;
  @useResult
  $Res call(
      {@HiveField(0) String? calories,
      @HiveField(1) String? carbohydrateContent,
      @HiveField(2) String? proteinContent,
      @HiveField(3) String? fatContent,
      @HiveField(4) String? saturatedFatContent,
      @HiveField(5) String? sodiumContent,
      @HiveField(6) String? fiberContent,
      @HiveField(7) String? sugarContent,
      @HiveField(8) String? servingSize});
}

/// @nodoc
class _$NutrientsCopyWithImpl<$Res, $Val extends Nutrients>
    implements $NutrientsCopyWith<$Res> {
  _$NutrientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? carbohydrateContent = freezed,
    Object? proteinContent = freezed,
    Object? fatContent = freezed,
    Object? saturatedFatContent = freezed,
    Object? sodiumContent = freezed,
    Object? fiberContent = freezed,
    Object? sugarContent = freezed,
    Object? servingSize = freezed,
  }) {
    return _then(_value.copyWith(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      carbohydrateContent: freezed == carbohydrateContent
          ? _value.carbohydrateContent
          : carbohydrateContent // ignore: cast_nullable_to_non_nullable
              as String?,
      proteinContent: freezed == proteinContent
          ? _value.proteinContent
          : proteinContent // ignore: cast_nullable_to_non_nullable
              as String?,
      fatContent: freezed == fatContent
          ? _value.fatContent
          : fatContent // ignore: cast_nullable_to_non_nullable
              as String?,
      saturatedFatContent: freezed == saturatedFatContent
          ? _value.saturatedFatContent
          : saturatedFatContent // ignore: cast_nullable_to_non_nullable
              as String?,
      sodiumContent: freezed == sodiumContent
          ? _value.sodiumContent
          : sodiumContent // ignore: cast_nullable_to_non_nullable
              as String?,
      fiberContent: freezed == fiberContent
          ? _value.fiberContent
          : fiberContent // ignore: cast_nullable_to_non_nullable
              as String?,
      sugarContent: freezed == sugarContent
          ? _value.sugarContent
          : sugarContent // ignore: cast_nullable_to_non_nullable
              as String?,
      servingSize: freezed == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NutrientsCopyWith<$Res> implements $NutrientsCopyWith<$Res> {
  factory _$$_NutrientsCopyWith(
          _$_Nutrients value, $Res Function(_$_Nutrients) then) =
      __$$_NutrientsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? calories,
      @HiveField(1) String? carbohydrateContent,
      @HiveField(2) String? proteinContent,
      @HiveField(3) String? fatContent,
      @HiveField(4) String? saturatedFatContent,
      @HiveField(5) String? sodiumContent,
      @HiveField(6) String? fiberContent,
      @HiveField(7) String? sugarContent,
      @HiveField(8) String? servingSize});
}

/// @nodoc
class __$$_NutrientsCopyWithImpl<$Res>
    extends _$NutrientsCopyWithImpl<$Res, _$_Nutrients>
    implements _$$_NutrientsCopyWith<$Res> {
  __$$_NutrientsCopyWithImpl(
      _$_Nutrients _value, $Res Function(_$_Nutrients) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? carbohydrateContent = freezed,
    Object? proteinContent = freezed,
    Object? fatContent = freezed,
    Object? saturatedFatContent = freezed,
    Object? sodiumContent = freezed,
    Object? fiberContent = freezed,
    Object? sugarContent = freezed,
    Object? servingSize = freezed,
  }) {
    return _then(_$_Nutrients(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      carbohydrateContent: freezed == carbohydrateContent
          ? _value.carbohydrateContent
          : carbohydrateContent // ignore: cast_nullable_to_non_nullable
              as String?,
      proteinContent: freezed == proteinContent
          ? _value.proteinContent
          : proteinContent // ignore: cast_nullable_to_non_nullable
              as String?,
      fatContent: freezed == fatContent
          ? _value.fatContent
          : fatContent // ignore: cast_nullable_to_non_nullable
              as String?,
      saturatedFatContent: freezed == saturatedFatContent
          ? _value.saturatedFatContent
          : saturatedFatContent // ignore: cast_nullable_to_non_nullable
              as String?,
      sodiumContent: freezed == sodiumContent
          ? _value.sodiumContent
          : sodiumContent // ignore: cast_nullable_to_non_nullable
              as String?,
      fiberContent: freezed == fiberContent
          ? _value.fiberContent
          : fiberContent // ignore: cast_nullable_to_non_nullable
              as String?,
      sugarContent: freezed == sugarContent
          ? _value.sugarContent
          : sugarContent // ignore: cast_nullable_to_non_nullable
              as String?,
      servingSize: freezed == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nutrients implements _Nutrients {
  const _$_Nutrients(
      {@HiveField(0) required this.calories,
      @HiveField(1) required this.carbohydrateContent,
      @HiveField(2) required this.proteinContent,
      @HiveField(3) required this.fatContent,
      @HiveField(4) required this.saturatedFatContent,
      @HiveField(5) required this.sodiumContent,
      @HiveField(6) required this.fiberContent,
      @HiveField(7) required this.sugarContent,
      @HiveField(8) required this.servingSize});

  factory _$_Nutrients.fromJson(Map<String, dynamic> json) =>
      _$$_NutrientsFromJson(json);

  @override
  @HiveField(0)
  final String? calories;
  @override
  @HiveField(1)
  final String? carbohydrateContent;
  @override
  @HiveField(2)
  final String? proteinContent;
  @override
  @HiveField(3)
  final String? fatContent;
  @override
  @HiveField(4)
  final String? saturatedFatContent;
  @override
  @HiveField(5)
  final String? sodiumContent;
  @override
  @HiveField(6)
  final String? fiberContent;
  @override
  @HiveField(7)
  final String? sugarContent;
  @override
  @HiveField(8)
  final String? servingSize;

  @override
  String toString() {
    return 'Nutrients(calories: $calories, carbohydrateContent: $carbohydrateContent, proteinContent: $proteinContent, fatContent: $fatContent, saturatedFatContent: $saturatedFatContent, sodiumContent: $sodiumContent, fiberContent: $fiberContent, sugarContent: $sugarContent, servingSize: $servingSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nutrients &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.carbohydrateContent, carbohydrateContent) ||
                other.carbohydrateContent == carbohydrateContent) &&
            (identical(other.proteinContent, proteinContent) ||
                other.proteinContent == proteinContent) &&
            (identical(other.fatContent, fatContent) ||
                other.fatContent == fatContent) &&
            (identical(other.saturatedFatContent, saturatedFatContent) ||
                other.saturatedFatContent == saturatedFatContent) &&
            (identical(other.sodiumContent, sodiumContent) ||
                other.sodiumContent == sodiumContent) &&
            (identical(other.fiberContent, fiberContent) ||
                other.fiberContent == fiberContent) &&
            (identical(other.sugarContent, sugarContent) ||
                other.sugarContent == sugarContent) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      calories,
      carbohydrateContent,
      proteinContent,
      fatContent,
      saturatedFatContent,
      sodiumContent,
      fiberContent,
      sugarContent,
      servingSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NutrientsCopyWith<_$_Nutrients> get copyWith =>
      __$$_NutrientsCopyWithImpl<_$_Nutrients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NutrientsToJson(
      this,
    );
  }
}

abstract class _Nutrients implements Nutrients {
  const factory _Nutrients(
      {@HiveField(0) required final String? calories,
      @HiveField(1) required final String? carbohydrateContent,
      @HiveField(2) required final String? proteinContent,
      @HiveField(3) required final String? fatContent,
      @HiveField(4) required final String? saturatedFatContent,
      @HiveField(5) required final String? sodiumContent,
      @HiveField(6) required final String? fiberContent,
      @HiveField(7) required final String? sugarContent,
      @HiveField(8) required final String? servingSize}) = _$_Nutrients;

  factory _Nutrients.fromJson(Map<String, dynamic> json) =
      _$_Nutrients.fromJson;

  @override
  @HiveField(0)
  String? get calories;
  @override
  @HiveField(1)
  String? get carbohydrateContent;
  @override
  @HiveField(2)
  String? get proteinContent;
  @override
  @HiveField(3)
  String? get fatContent;
  @override
  @HiveField(4)
  String? get saturatedFatContent;
  @override
  @HiveField(5)
  String? get sodiumContent;
  @override
  @HiveField(6)
  String? get fiberContent;
  @override
  @HiveField(7)
  String? get sugarContent;
  @override
  @HiveField(8)
  String? get servingSize;
  @override
  @JsonKey(ignore: true)
  _$$_NutrientsCopyWith<_$_Nutrients> get copyWith =>
      throw _privateConstructorUsedError;
}
