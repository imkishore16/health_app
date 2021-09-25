// ignore_for_file: file_names

import 'package:hive/hive.dart';
part 'loginData.g.dart';

@HiveType(typeId:0)
class LoginData extends HiveObject{
@HiveField(1)
late String username;
  
@HiveField(2)
late String password;
}
 