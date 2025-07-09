class ProductModel {
  final num price;
  final String name;
  final String image;
  final String? desc;
  final List<dynamic>? size;

  ProductModel({
    required this.size,
    required this.desc,
    required this.name,
    required this.image,
    required this.price,
  });

  factory ProductModel.dummy() {
    return ProductModel(
        image: 'https://rb.gy/ax32e5', size: [], desc: '', name: '', price: 0);
  }

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      size: jsonData['size'],
      image: jsonData['image'],
      name: jsonData['name'],
      price: jsonData['price'],
      desc: jsonData['desc'],
    );
  }
}
