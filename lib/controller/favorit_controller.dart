import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Favoritcontroller extends GetxController {
  static Database? _db;
  var tasks = <TeamModel>[].obs;
  var likedTeams = <String, bool>{}.obs; // To track liked teams

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 2, // Update the version
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE tasks(
            idTeam TEXT, 
            strTeam TEXT, 
            strLocation TEXT,
            strDescriptionEN TEXT,  
            strBadge TEXT, 
            isLiked INTEGER 
          )
        ''');

      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE tasks ADD COLUMN strDescriptionEN TEXT');
        }
      },
    );
  }

  // Insert Task
  Future<int> addTask(TeamModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    likedTeams[task.idTeam!] = true;
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => TeamModel.fromMap(data)).toList());
  }

  // Delete Task
  Future<void> deleteTask(String idTeam) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'idTeam = ?', whereArgs: [idTeam]);
    likedTeams.remove(idTeam);
    loadTasks();
  }

  Rx<bool> getLikedById(String idTeam) {
    return (likedTeams.containsKey(idTeam) && likedTeams[idTeam] == true).obs;
  }
}



