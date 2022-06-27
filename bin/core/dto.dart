import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class Dto extends Equatable {
  @JsonKey(name: '_id', fromJson: parseId)
  late final String id;
}

String parseId(dynamic obj) => (obj as ObjectId).id.hexString;