import 'package:flutterwidgets/save%20data%20locally/model/localstorage.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LocalStrorage> getStorageBox() => Hive.box('quotes');
}
