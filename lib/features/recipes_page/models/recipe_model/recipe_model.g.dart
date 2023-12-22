// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutrientsAdapter extends TypeAdapter<Nutrients> {
  @override
  final int typeId = 0;

  @override
  Nutrients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrients(
      calories: fields[0] as String?,
      carbohydrateContent: fields[1] as String?,
      proteinContent: fields[2] as String?,
      fatContent: fields[3] as String?,
      saturatedFatContent: fields[4] as String?,
      sodiumContent: fields[5] as String?,
      fiberContent: fields[6] as String?,
      sugarContent: fields[7] as String?,
      servingSize: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrients obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.carbohydrateContent)
      ..writeByte(2)
      ..write(obj.proteinContent)
      ..writeByte(3)
      ..write(obj.fatContent)
      ..writeByte(4)
      ..write(obj.saturatedFatContent)
      ..writeByte(5)
      ..write(obj.sodiumContent)
      ..writeByte(6)
      ..write(obj.fiberContent)
      ..writeByte(7)
      ..write(obj.sugarContent)
      ..writeByte(8)
      ..write(obj.servingSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      key: json['key'],
      host: json['host'] as String,
      title: json['title'] as String,
      total_time: json['total_time'] as int,
      image: json['image'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      instructions: json['instructions'] as String,
      nutrients: Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
      servings: json['servings'] as String,
      addTime: json['addTime'] as String? ?? '',
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'host': instance.host,
      'title': instance.title,
      'total_time': instance.total_time,
      'image': instance.image,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'nutrients': instance.nutrients,
      'servings': instance.servings,
      'addTime': instance.addTime,
    };

_$_Nutrients _$$_NutrientsFromJson(Map<String, dynamic> json) => _$_Nutrients(
      calories: json['calories'] as String?,
      carbohydrateContent: json['carbohydrateContent'] as String?,
      proteinContent: json['proteinContent'] as String?,
      fatContent: json['fatContent'] as String?,
      saturatedFatContent: json['saturatedFatContent'] as String?,
      sodiumContent: json['sodiumContent'] as String?,
      fiberContent: json['fiberContent'] as String?,
      sugarContent: json['sugarContent'] as String?,
      servingSize: json['servingSize'] as String?,
    );

Map<String, dynamic> _$$_NutrientsToJson(_$_Nutrients instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carbohydrateContent': instance.carbohydrateContent,
      'proteinContent': instance.proteinContent,
      'fatContent': instance.fatContent,
      'saturatedFatContent': instance.saturatedFatContent,
      'sodiumContent': instance.sodiumContent,
      'fiberContent': instance.fiberContent,
      'sugarContent': instance.sugarContent,
      'servingSize': instance.servingSize,
    };
