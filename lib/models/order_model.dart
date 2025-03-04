class Order {
  final String orderStatus;
  final bool issue;
  final List<Map<String, dynamic>> items;
  final String documentId;

  Order({
    required this.orderStatus,
    required this.issue,
    required this.items,
    required this.documentId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderStatus: json['orderStatus'],
      issue: json['issue'],
      items: List<Map<String, dynamic>>.from(json['items']),
      documentId: json['documentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderStatus': orderStatus,
      'issue': issue,
      'items': items,
    };
  }
}