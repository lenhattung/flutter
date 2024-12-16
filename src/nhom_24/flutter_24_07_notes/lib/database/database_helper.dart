import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class DatabaseHelper{
    static Database? _database; // static + nullable
    static final DatabaseHelper instance = DatabaseHelper._(); // singleton pattern

    DatabaseHelper._(); // Private constructor

    // Getter để lấy instance của database:
    Future<Database> get database async {
        if(_database!=null) return _database!;
        _database = await _initDB();
        return _database!;
    }

    // Khởi tạo database:
    // version để quản lý phiên bản database
    // onCreate sẽ được gọi khi database được tạo lần đầu
    Future<Database> _initDB() async {
      String path = join(await getDatabasesPath(), 'notes.db');
      return await openDatabase(
          path,
          version: 1,
          onCreate: _createDB,
      );
    }

    // Tạo bảng trong database:
    Future<void> _createDB(Database db, int version) async {
      await db.execute('''
        CREATE TABLE notes (
            id        INTEGER PRIMARY KEY,
            title     TEXT    NOT NULL,
            content   TEXT    NOT NULL,
            createdAt TEXT    NOT NULL
        )
      ''');
    }

    // Thêm ghi chú:
    Future<int> insertNote(Note note) async {
      final db = await database;
      return await db.insert('notes', note.toMap());
    }

    // Lấy danh sách ghi chú:
    Future<List<Note>> getNotes() async {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('notes', orderBy: 'createdAt DESC');
      return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
    }

    // Xóa
    Future<int> deleteNote(int id) async {
      final db = await database;
      return await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );
    }

}