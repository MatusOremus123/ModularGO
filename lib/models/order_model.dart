class Order {
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String userId;

  Order({
    required this.items,
    required this.totalAmount,
    required this.userId,
  });


  Map<String, dynamic> toJson() {
    return {
      'items': items,
      'totalAmount': totalAmount,
      'user': userId,
    };
  }
}