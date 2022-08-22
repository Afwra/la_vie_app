class CartModel{
  int? id;
  String? productId;
  String? name;
  String? image;
  num? price;
  int? count;

  CartModel.fromDB(Map<String,dynamic> db){
    id = db['id'];
    productId = db['productId'];
    name = db['name'];
    price = db['price'];
    count = db['count'];
    image = db['image'];
  }
}