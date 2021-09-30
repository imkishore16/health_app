// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginDataAdapter extends TypeAdapter<LoginData> {
  @override
  final int typeId = 0;

  @override
  LoginData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginData()
      ..username = fields[1] as String
      ..age = fields[2] as int
      ..height = fields[3] as double
      ..weight = fields[4] as double;
  }

  @override
  void write(BinaryWriter writer, LoginData obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
