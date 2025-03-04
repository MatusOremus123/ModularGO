class Pickup {
  final String documentId;
  final String? orderDocumentId;
  final String progress;
  final List<PickupItem> items;

  Pickup({
    required this.documentId,
    this.orderDocumentId,
    required this.progress,
    required this.items,
  });

  factory Pickup.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return Pickup(
      documentId: data['documentId'] ?? '',
      orderDocumentId: data['orderDocumentId'], // Can be null
      progress: data['progress'] ?? 'pending',
      items: (data['items'] as List?)?.map((item) => PickupItem.fromJson(item)).toList() ?? [],
    );
  }
}

class PickupItem {
  final String product;
  final int required;
  final int shipped;

  PickupItem({
    required this.product,
    required this.required,
    required this.shipped,
  });

  factory PickupItem.fromJson(Map<String, dynamic> json) {
    return PickupItem(
      product: json['product']?['data']?['id']?.toString() ?? 'Unknown',
      required: json['required'] ?? 0,
      shipped: json['shipped'] ?? 0,
    );
  }
}
