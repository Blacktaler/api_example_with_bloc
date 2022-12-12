import 'package:api_example/data/models/home_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductDatabase{
  static final instance  = ProductDatabase._initialize();
  ProductDatabase._initialize();

  Database? _database;

  Future<Database> get database async{
    if(_database!=null)return _database!;

    return await _initDB('products.db');
  }

  _initDB(String file)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,file);
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }

  _onCreate(Database db,int version)async{
    const textType ='TEXT NOT NULL';
    const intType = 'INTEGER';
    const doubleType = 'DOUBLE NOT NULL';
    await db.execute('''CREATE TABLE IF NOT EXISTS product(
      _id INTEGER PRIMARY KEY AUTOINCREMENT,
      id $intType,
      title $textType,
      description $textType,
      price $intType,
      discountPercentage $doubleType,
      rating $doubleType,
      stock $intType,
      brand $textType,
      category $textType,
      thumbnail $textType,
      images $textType)''');
  }

  readAllProducts()async{
    final db =await instance.database;
    final data = await db.query('product');
    return data.map((e) => Product.fromMap(e)).toList();
  }

  create(Product product)async{
    final db = await instance.database;
    await db.insert('product', product.toJson()); 
  }
}