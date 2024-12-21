class CartItem {
  final int productId;
  int quantity;
  final double unitRate;
  double total;
  String productName;

  CartItem({
    required this.productId,
    required this.quantity,
    required this.unitRate,
    required this.productName,
  }) : total = unitRate * quantity;

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    total = unitRate * quantity;
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "unit_rate": unitRate,
        "total": total,
        "prodcut_name" : productName
      };

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      quantity: json['quantity'],
      unitRate: json['unit_rate'],
      productName: json['prodcut_name']
    );
  }

  @override
  String toString() => toJson().toString();
}
