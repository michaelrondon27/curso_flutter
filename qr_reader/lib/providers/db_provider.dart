import 'package:sqflite/sqflite.dart';

class DBProvider {

  static late Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get databse async {
    if (_database != null ) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {

  }

}