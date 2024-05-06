import 'package:project/api/model/info.dart';
import 'package:project/api/model/save.dart';

abstract class Model extends Save implements Info {
  Model();
  Model fromJson({required Map<String, dynamic> json});
  Map<String, dynamic> toJson();

  @override
  String getNoImage() =>
      'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg';
}
