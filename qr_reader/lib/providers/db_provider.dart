import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if ( _database != null ) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'ScansDB.db' );

    return await openDatabase(
      path,
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
      onOpen: ( db ) {},
      version: 1,
    );
  }

  Future<int> nuevoScan( ScanModel nuevoScan ) async {
    final db = await database;

    final res = await db?.insert('scans', nuevoScan.toJson());

    return res!;
  }

  Future<ScanModel?> getScanById( int id ) async {
    final db = await database;

    final res = await db?.query('scans', where: 'id = ?', whereArgs: [id]);

    return res!.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosLosScans() async {
    final db = await database;

    final res = await db?.query('scans');

    return res!.isNotEmpty ? res.map( (s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansPorTipo( String tipo ) async {
    final db = await database;

    final res = await db?.query('scans', where: 'tipo = ?', whereArgs: [tipo]);

    return res!.isNotEmpty ? res.map( (s) => ScanModel.fromJson(s)).toList() : [];
  }
}
