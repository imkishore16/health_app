// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginDataAdapter extends TypeAdapter<LoginData> {
  @override
  final int typeId = 1122;

  @override
  LoginData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginData()
      ..userName = fields[1] as String
      ..password = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, LoginData obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.password);
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
