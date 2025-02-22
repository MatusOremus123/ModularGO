class Order {
  final String orderStatus;
  final bool issue;
  final List<Map<String, dynamic>> items;

  Order({
    required this.orderStatus,
    required this.issue,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderStatus': orderStatus,
      'issue': issue,
      'items': items,
    };
  }
}