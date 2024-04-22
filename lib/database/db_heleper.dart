import 'package:path/path.dart';
import 'package:rss_newsapp/model/rssfeeditem.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper.init();
  static Database? _database;

  static const newsTable = 'news_table';
  static const channelId = 'id';
  static const channelName = 'name';
  static const channelUrl = 'url';

  DataBaseHelper.init();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase('news.db');
    return _database;
  }

  Future<Database> initDatabase(String dbName) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, dbName);
    print("Database path: $path");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<int> deleteChannel(String name, String url) async {
    final db = await database;
    return await db!.delete(
      newsTable,
      where: '$channelName = ? AND $channelUrl = ?',
      whereArgs: [name, url],
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $newsTable (
      $channelId INTEGER PRIMARY KEY AUTOINCREMENT,
      $channelName TEXT NOT NULL,
      $channelUrl TEXT TEXT NOT NULL
    
    )
  ''');

    newsData.forEach(
      (quiz) async {
        final id = await db.insert(newsTable, quiz.toJson());
      },
    );
  }

  Future<List<NewsModel>> getNewsData() async {
    var db = await instance.database;
    final getResult = await db!.rawQuery('SELECT * FROM $newsTable');

    return getResult.map((qJson) => NewsModel.fromJson(qJson)).toList();
  }

  Future<List<Map<String, String>>> getChannelNamesAndUrls() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(newsTable);

    var channelList = maps
        .map((map) => {
              'name': map[channelName] as String,
              'url': map[channelUrl] as String,
            })
        .toList();

    return channelList;
  }

  Future<int> insertChannel(String name, String url) async {
    final db = await database;
    final channel = {
      channelName: name,
      channelUrl: url,
    };
    return await db!.insert(newsTable, channel);
  }
}
