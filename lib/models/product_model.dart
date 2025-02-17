class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {

    final images = json['images'] as List?;
    final baseUrl = 'https://mad-shop.onrender.com';
    String imageUrl = '$baseUrl/uploads/placeholder.png';

    if (images!.isNotEmpty) {
      final firstImage = images[0];
      if (firstImage['formats'] != null && firstImage['formats']['small'] != null) {
        imageUrl = firstImage['formats']['small']['url'];
      } else if (firstImage['url'] != null) {
        imageUrl = firstImage['url'];
      }
    }


    final priceData = json['price'] as Map<String, dynamic>?;
    final double price = priceData != null
        ? (priceData['netPrice'] ?? 0.0).toDouble()
        : 0.0;

    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unnamed Product',
      description: json['description'] ?? 'No description',
      imageUrl: imageUrl,
      price: price,
    );
  }
}