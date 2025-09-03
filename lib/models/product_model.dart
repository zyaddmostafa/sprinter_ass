class Product {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String? description;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.description,
    this.isFeatured = false,
  });
}
