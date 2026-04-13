import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  // Obtener la BD
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  // Inicializar BD
  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Crear tablas
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE reportes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT,
        fecha TEXT
      )
    ''');
  }

  // Insertar usuario
  Future<int> insertUser(String email, String password) async {
    final db = await instance.database;
    return await db.insert('usuarios', {
      'email': email,
      'password': password,
    });
  }

  // Login
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final db = await instance.database;

    final result = await db.query(
      'usuarios',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return result.isNotEmpty ? result.first : null;
  }

  // Insertar reporte
  Future<int> insertReporte(String descripcion) async {
    final db = await instance.database;

    return await db.insert('reportes', {
      'descripcion': descripcion,
      'fecha': DateTime.now().toString(),
    });
  }

  // Obtener reportes
  Future<List<Map<String, dynamic>>> getReportes() async {
    final db = await instance.database;
    return await db.query('reportes');
  }
}