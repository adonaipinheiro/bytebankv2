import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(String daoExecuteSQL) async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(daoExecuteSQL);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
