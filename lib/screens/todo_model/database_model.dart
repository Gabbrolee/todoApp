import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './model.dart';

class DatabaseConnect {
  Database? _database;
  // creating a getter and open a connection to a database
  Future<Database> get database async {
    // location of our database n device
    final databasePath = await getDatabasesPath();
    const databaseName = 'todo.db';
    // joins the dbpath and dbName and create a full path for database
    final path = join(databasePath, databaseName);
    _database = await openDatabase(path, version: 1, onCreate: _createDb);
    // create database function
    return _database!;
  }
  // create database function
// create table in our database
  Future<void> _createDb(Database db, int version) async {
    // making sure the model field matches column in the database
    await db.execute('''
       CREATE TABLE todo(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       title TEXT,
       creationDate TEXT,
       isChecked INTEGER
           )
   ''');
  }

  // function to add data into the database
  Future<void> insertTodo(Todo todo) async {
    // get connection to the database
    final db = await database;
    //insert  the todo
    await db.insert(
      'todo', // name of the table
      todo.toMap(), // function created in model
      conflictAlgorithm: ConflictAlgorithm
          .replace, //this will replace duplicate in entry

    );
  }

  // function to delete todo from the database
  Future<void> deleteTodo(Todo todo) async {
    // get connection to the database
    final db = await database;
    //delete  he todo
    await db.delete(
      'todo', // name of the table
      where: 'id == ? ', // check id in todo
      whereArgs: [todo.id],

    );
  }
  // function to fetch all todo from the database
  Future<List<Todo>> getTodo() async {
    final db = await database ;
    // query the database and save the todo as list of maps
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id Desc', // this will order the list in descending order
    );

    // converting the items from lists of maps to list of todo
    return List.generate(
      items.length,
          (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i]['creationDate']), // coverting to data format
        isChecked: items[i]['isChecked'] ==  1 ? true : false,
      ),
    );
  }
  // function to fetch all Done todo from the database
  Future<List<Todo>> getDoneTodo() async {
    final db = await database ;
    // query the database and save the todo as list of maps
    List<Map<String, dynamic>> items = await db.query(
        'todo',
        orderBy: 'id Desc', // this will order the list in descending order
        where: 'isChecked == 1 '
    );

    // converting the items from lists of maps to list of todo
    return List.generate(
      items.length,
          (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i]['creationDate']), // coverting to data format
        isChecked: items[i]['isChecked'] ==  1 ? true : false,
      ),
    );
  }
}
