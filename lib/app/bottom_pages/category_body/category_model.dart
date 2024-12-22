class CategoryModel {
  String? productCategorySlNo;
  String? productCategoryName;
  String? productCategoryDescription;
  String? status;
  String? addBy;
  String? addTime;
  String? updateBy;
  String? updateTime;
  String? categoryBranchid;

  CategoryModel(
      {this.productCategorySlNo,
      this.productCategoryName,
      this.productCategoryDescription,
      this.status,
      this.addBy,
      this.addTime,
      this.updateBy,
      this.updateTime,
      this.categoryBranchid});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    productCategorySlNo = json['ProductCategory_SlNo'];
    productCategoryName = json['ProductCategory_Name'];
    productCategoryDescription = json['ProductCategory_Description'];
    status = json['status'];
    addBy = json['AddBy'];
    addTime = json['AddTime'];
    updateBy = json['UpdateBy'];
    updateTime = json['UpdateTime'];
    categoryBranchid = json['category_branchid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductCategory_SlNo'] = this.productCategorySlNo;
    data['ProductCategory_Name'] = this.productCategoryName;
    data['ProductCategory_Description'] = this.productCategoryDescription;
    data['status'] = this.status;
    data['AddBy'] = this.addBy;
    data['AddTime'] = this.addTime;
    data['UpdateBy'] = this.updateBy;
    data['UpdateTime'] = this.updateTime;
    data['category_branchid'] = this.categoryBranchid;
    return data;
  }
}
