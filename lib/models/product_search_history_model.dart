class ProductSearchHistoryModel{
  int? id;
  String? text;

  ProductSearchHistoryModel.fromDB(Map<String,dynamic> db){
    id = db['id'];
    text = db['text'];
  }
}