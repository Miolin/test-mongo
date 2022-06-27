import 'package:json_annotation/json_annotation.dart';

import '../core/dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends Dto {
  final String name;

  UserDto(this.name);

  @override
  List<Object?> get props => [id, name];

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}