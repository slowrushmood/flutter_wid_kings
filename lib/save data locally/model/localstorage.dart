import 'package:hive/hive.dart';

part 'localstorage.g.dart';

@HiveType(typeId: 0)
class LocalStrorage extends HiveObject {
  @HiveField(0)
   late String paragraph;
}
