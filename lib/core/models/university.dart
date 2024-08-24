import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class University {
  @HiveField(0)
  final int id;
  @HiveField(1)
  bool title;

  University({
    required this.id,
    required this.title,
  });
}

class UniversityAdapter extends TypeAdapter<University> {
  @override
  final typeId = 0;

  @override
  University read(BinaryReader reader) {
    return University(
      id: reader.read(),
      title: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, University obj) {
    writer.write(obj.id);
    writer.write(obj.title);
  }
}
