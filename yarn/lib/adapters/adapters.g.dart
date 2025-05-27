// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class YarnAdapter extends TypeAdapter<Yarn> {
  @override
  final typeId = 0;

  @override
  Yarn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Yarn(
      name: fields[0] as String,
      brand: fields[1] as String,
      color: fields[2] as String,
      weight: (fields[3] as num).toInt(),
      length: (fields[4] as num).toDouble(),
      material: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Yarn obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.length)
      ..writeByte(5)
      ..write(obj.material);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YarnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NeedleAdapter extends TypeAdapter<Needle> {
  @override
  final typeId = 1;

  @override
  Needle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Needle(
      type: fields[0] as String,
      size: (fields[1] as num).toDouble(),
      material: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Needle obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.material);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeedleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyPatternAdapter extends TypeAdapter<MyPattern> {
  @override
  final typeId = 2;

  @override
  MyPattern read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyPattern(
      title: fields[0] as String,
      description: fields[1] as String,
      imagePath: fields[2] as String,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MyPattern obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyPatternAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final typeId = 3;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      name: fields[0] as String,
      description: fields[1] as String,
      startDate: fields[2] as DateTime,
      endDate: fields[3] as DateTime,
      progress: (fields[4] as num).toInt(),
      patternId: (fields[5] as num?)?.toInt(),
      yarnIds: (fields[6] as List).cast<int>(),
      needleIds: (fields[7] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.progress)
      ..writeByte(5)
      ..write(obj.patternId)
      ..writeByte(6)
      ..write(obj.yarnIds)
      ..writeByte(7)
      ..write(obj.needleIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
