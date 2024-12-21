class ProductModel {
  String? productSlNo;
  String? productCode;
  String? productName;
  String? productCategoryID;
  String? geneticId;
  String? companyId;
  String? brand;
  String? vat;
  String? productReOrederLevel;
  String? productPurchaseRate;
  String? productSellingPrice;
  String? productMinimumSellingPrice;
  String? productWholesaleRate;
  String? perUnit;
  String? convertionName;
  String? isService;
  String? unitID;
  String? imageName;
  String? shelfLocation;
  String? status;
  String? addBy;
  String? addTime;
  String? updateBy;
  String? updateTime;
  String? productBranchid;
  String? displayText;
  String? productCategoryName;
  String? brandName;
  String? unitName;

  ProductModel(
      {this.productSlNo,
      this.productCode,
      this.productName,
      this.productCategoryID,
      this.geneticId,
      this.companyId,
      this.brand,
      this.vat,
      this.productReOrederLevel,
      this.productPurchaseRate,
      this.productSellingPrice,
      this.productMinimumSellingPrice,
      this.productWholesaleRate,
      this.perUnit,
      this.convertionName,
      this.isService,
      this.unitID,
      this.imageName,
      this.shelfLocation,
      this.status,
      this.addBy,
      this.addTime,
      this.updateBy,
      this.updateTime,
      this.productBranchid,
      this.displayText,
      this.productCategoryName,
      this.brandName,
      this.unitName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productSlNo = json['Product_SlNo'];
    productCode = json['Product_Code'];
    productName = json['Product_Name'];
    productCategoryID = json['ProductCategory_ID'];
    geneticId = json['genetic_id'];
    companyId = json['company_id'];
    brand = json['brand'];
    vat = json['vat'];
    productReOrederLevel = json['Product_ReOrederLevel'];
    productPurchaseRate = json['Product_Purchase_Rate'];
    productSellingPrice = json['Product_SellingPrice'];
    productMinimumSellingPrice = json['Product_MinimumSellingPrice'];
    productWholesaleRate = json['Product_WholesaleRate'];
    perUnit = json['per_unit'];
    convertionName = json['convertion_name'];
    isService = json['is_service'];
    unitID = json['Unit_ID'];
    imageName = json['image_name'];
    shelfLocation = json['shelf_location'];
    status = json['status'];
    addBy = json['AddBy'];
    addTime = json['AddTime'];
    updateBy = json['UpdateBy'];
    updateTime = json['UpdateTime'];
    productBranchid = json['Product_branchid'];
    displayText = json['display_text'];
    productCategoryName = json['ProductCategory_Name'];
    brandName = json['brand_name'];
    unitName = json['Unit_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product_SlNo'] = this.productSlNo;
    data['Product_Code'] = this.productCode;
    data['Product_Name'] = this.productName;
    data['ProductCategory_ID'] = this.productCategoryID;
    data['genetic_id'] = this.geneticId;
    data['company_id'] = this.companyId;
    data['brand'] = this.brand;
    data['vat'] = this.vat;
    data['Product_ReOrederLevel'] = this.productReOrederLevel;
    data['Product_Purchase_Rate'] = this.productPurchaseRate;
    data['Product_SellingPrice'] = this.productSellingPrice;
    data['Product_MinimumSellingPrice'] = this.productMinimumSellingPrice;
    data['Product_WholesaleRate'] = this.productWholesaleRate;
    data['per_unit'] = this.perUnit;
    data['convertion_name'] = this.convertionName;
    data['is_service'] = this.isService;
    data['Unit_ID'] = this.unitID;
    data['image_name'] = this.imageName;
    data['shelf_location'] = this.shelfLocation;
    data['status'] = this.status;
    data['AddBy'] = this.addBy;
    data['AddTime'] = this.addTime;
    data['UpdateBy'] = this.updateBy;
    data['UpdateTime'] = this.updateTime;
    data['Product_branchid'] = this.productBranchid;
    data['display_text'] = this.displayText;
    data['ProductCategory_Name'] = this.productCategoryName;
    data['brand_name'] = this.brandName;
    data['Unit_Name'] = this.unitName;
    return data;
  }
}
