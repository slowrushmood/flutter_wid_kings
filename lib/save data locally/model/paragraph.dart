import 'package:hive/hive.dart';

part 'paragraph.g.dart';

@HiveType(typeId: 1)

class Paragraph extends HiveObject {
  @HiveField(0)
  String? author;

  @HiveField(1)
  String? quote;
}
