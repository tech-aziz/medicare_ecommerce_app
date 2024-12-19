class ProductModel {
  final String productName;
  final String productCode;
  final String productCategoryName;
  final String unitName;
  final String? imageName;
  final double productSellingPrice;
  final double productPurchaseRate;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.productCategoryName,
    required this.unitName,
    required this.productSellingPrice,
    required this.productPurchaseRate,
    this.imageName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['Product_Name'] ?? '',
      productCode: json['Product_Code'] ?? '',
      productCategoryName: json['ProductCategory_Name'] ?? '',
      unitName: json['Unit_Name'] ?? '',
      imageName: json['image_name'],
      productSellingPrice:
          double.tryParse(json['Product_SellingPrice'] ?? '0') ?? 0.0,
      productPurchaseRate:
          double.tryParse(json['Product_Purchase_Rate'] ?? '0') ?? 0.0,
    );
  }
}
