// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variables_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel()
      ..weatherDescription = fields[0] as String
      ..mainTemp = fields[1] as double
      ..mainFeelsLike = fields[2] as double
      ..mainHumidity = fields[3] as int
      ..windSpeed = fields[4] as double
      ..ciudad = fields[5] as String
      ..pais = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.weatherDescription)
      ..writeByte(1)
      ..write(obj.mainTemp)
      ..writeByte(2)
      ..write(obj.mainFeelsLike)
      ..writeByte(3)
      ..write(obj.mainHumidity)
      ..writeByte(4)
      ..write(obj.windSpeed)
      ..writeByte(5)
      ..write(obj.ciudad)
      ..writeByte(6)
      ..write(obj.pais);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
