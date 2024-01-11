import 'package:json_annotation/json_annotation.dart';
part 'signIn.g.dart';

@JsonSerializable()
class SignIn {
  final int id;

  SignIn({
    this.id = 0
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
