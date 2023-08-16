class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String imageUrl;
  final String rating;
  final String ratingCount;
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imageUrl,
      required this.rating,
      required this.ratingCount});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: json['rating']['rate'].toString(),
      ratingCount: json['rating']['count'].toString(),
    );
  }
}
