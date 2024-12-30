class OrderHistoryModel {
  String? saleMasterSlNo;
  String? saleMasterInvoiceNo;
  String? salseCustomerIDNo;
  dynamic? employeeId;
  String? saleMasterSaleDate;
  String? saleMasterDescription;
  String? saleMasterSaleType;
  String? paymentType;
  dynamic? bankId;
  String? saleMasterTotalSaleAmount;
  String? saleMasterTotalDiscountAmount;
  String? saleMasterTaxAmount;
  String? saleMasterFreight;
  String? saleMasterSubTotalAmount;
  String? saleMasterCashPaid;
  String? saleMasterBankPaid;
  String? saleMasterPaidAmount;
  String? saleMasterDueAmount;
  dynamic? saleMasterPreviousDue;
  String? status;
  String? isService;
  String? addBy;
  String? addTime;
  dynamic? updateBy;
  dynamic? updateTime;
  String? saleMasterBranchid;
  String? customerCode;
  String? customerName;
  String? customerMobile;
  String? customerAddress;
  dynamic? employeeName;
  String? brunchName;
  List<SaleDetails>? saleDetails;

  OrderHistoryModel(
      {this.saleMasterSlNo,
      this.saleMasterInvoiceNo,
      this.salseCustomerIDNo,
      this.employeeId,
      this.saleMasterSaleDate,
      this.saleMasterDescription,
      this.saleMasterSaleType,
      this.paymentType,
      this.bankId,
      this.saleMasterTotalSaleAmount,
      this.saleMasterTotalDiscountAmount,
      this.saleMasterTaxAmount,
      this.saleMasterFreight,
      this.saleMasterSubTotalAmount,
      this.saleMasterCashPaid,
      this.saleMasterBankPaid,
      this.saleMasterPaidAmount,
      this.saleMasterDueAmount,
      this.saleMasterPreviousDue,
      this.status,
      this.isService,
      this.addBy,
      this.addTime,
      this.updateBy,
      this.updateTime,
      this.saleMasterBranchid,
      this.customerCode,
      this.customerName,
      this.customerMobile,
      this.customerAddress,
      this.employeeName,
      this.brunchName,
      this.saleDetails});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    saleMasterSlNo = json['SaleMaster_SlNo'];
    saleMasterInvoiceNo = json['SaleMaster_InvoiceNo'];
    salseCustomerIDNo = json['SalseCustomer_IDNo'];
    employeeId = json['employee_id'];
    saleMasterSaleDate = json['SaleMaster_SaleDate'];
    saleMasterDescription = json['SaleMaster_Description'];
    saleMasterSaleType = json['SaleMaster_SaleType'];
    paymentType = json['payment_type'];
    bankId = json['bank_id'];
    saleMasterTotalSaleAmount = json['SaleMaster_TotalSaleAmount'];
    saleMasterTotalDiscountAmount = json['SaleMaster_TotalDiscountAmount'];
    saleMasterTaxAmount = json['SaleMaster_TaxAmount'];
    saleMasterFreight = json['SaleMaster_Freight'];
    saleMasterSubTotalAmount = json['SaleMaster_SubTotalAmount'];
    saleMasterCashPaid = json['SaleMaster_cashPaid'];
    saleMasterBankPaid = json['SaleMaster_bankPaid'];
    saleMasterPaidAmount = json['SaleMaster_PaidAmount'];
    saleMasterDueAmount = json['SaleMaster_DueAmount'];
    saleMasterPreviousDue = json['SaleMaster_Previous_Due'];
    status = json['Status'];
    isService = json['is_service'];
    addBy = json['AddBy'];
    addTime = json['AddTime'];
    updateBy = json['UpdateBy'];
    updateTime = json['UpdateTime'];
    saleMasterBranchid = json['SaleMaster_branchid'];
    customerCode = json['Customer_Code'];
    customerName = json['Customer_Name'];
    customerMobile = json['Customer_Mobile'];
    customerAddress = json['Customer_Address'];
    employeeName = json['Employee_Name'];
    brunchName = json['Brunch_name'];
    if (json['saleDetails'] != null) {
      saleDetails = <SaleDetails>[];
      json['saleDetails'].forEach((v) {
        saleDetails!.add(new SaleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleMaster_SlNo'] = this.saleMasterSlNo;
    data['SaleMaster_InvoiceNo'] = this.saleMasterInvoiceNo;
    data['SalseCustomer_IDNo'] = this.salseCustomerIDNo;
    data['employee_id'] = this.employeeId;
    data['SaleMaster_SaleDate'] = this.saleMasterSaleDate;
    data['SaleMaster_Description'] = this.saleMasterDescription;
    data['SaleMaster_SaleType'] = this.saleMasterSaleType;
    data['payment_type'] = this.paymentType;
    data['bank_id'] = this.bankId;
    data['SaleMaster_TotalSaleAmount'] = this.saleMasterTotalSaleAmount;
    data['SaleMaster_TotalDiscountAmount'] = this.saleMasterTotalDiscountAmount;
    data['SaleMaster_TaxAmount'] = this.saleMasterTaxAmount;
    data['SaleMaster_Freight'] = this.saleMasterFreight;
    data['SaleMaster_SubTotalAmount'] = this.saleMasterSubTotalAmount;
    data['SaleMaster_cashPaid'] = this.saleMasterCashPaid;
    data['SaleMaster_bankPaid'] = this.saleMasterBankPaid;
    data['SaleMaster_PaidAmount'] = this.saleMasterPaidAmount;
    data['SaleMaster_DueAmount'] = this.saleMasterDueAmount;
    data['SaleMaster_Previous_Due'] = this.saleMasterPreviousDue;
    data['Status'] = this.status;
    data['is_service'] = this.isService;
    data['AddBy'] = this.addBy;
    data['AddTime'] = this.addTime;
    data['UpdateBy'] = this.updateBy;
    data['UpdateTime'] = this.updateTime;
    data['SaleMaster_branchid'] = this.saleMasterBranchid;
    data['Customer_Code'] = this.customerCode;
    data['Customer_Name'] = this.customerName;
    data['Customer_Mobile'] = this.customerMobile;
    data['Customer_Address'] = this.customerAddress;
    data['Employee_Name'] = this.employeeName;
    data['Brunch_name'] = this.brunchName;
    if (this.saleDetails != null) {
      data['saleDetails'] = this.saleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleDetails {
  String? saleDetailsSlNo;
  String? saleMasterIDNo;
  String? productIDNo;
  String? saleDetailsTotalQuantity;
  String? purchaseRate;
  String? saleDetailsRate;
  String? saleDetailsDiscount;
  String? discountAmount;
  String? saleDetailsTax;
  String? saleDetailsTotalAmount;
  String? status;
  String? addBy;
  String? addTime;
  Null? updateBy;
  Null? updateTime;
  String? saleDetailsBranchId;
  String? productName;
  String? productCategoryName;

  SaleDetails(
      {this.saleDetailsSlNo,
      this.saleMasterIDNo,
      this.productIDNo,
      this.saleDetailsTotalQuantity,
      this.purchaseRate,
      this.saleDetailsRate,
      this.saleDetailsDiscount,
      this.discountAmount,
      this.saleDetailsTax,
      this.saleDetailsTotalAmount,
      this.status,
      this.addBy,
      this.addTime,
      this.updateBy,
      this.updateTime,
      this.saleDetailsBranchId,
      this.productName,
      this.productCategoryName});

  SaleDetails.fromJson(Map<String, dynamic> json) {
    saleDetailsSlNo = json['SaleDetails_SlNo'];
    saleMasterIDNo = json['SaleMaster_IDNo'];
    productIDNo = json['Product_IDNo'];
    saleDetailsTotalQuantity = json['SaleDetails_TotalQuantity'];
    purchaseRate = json['Purchase_Rate'];
    saleDetailsRate = json['SaleDetails_Rate'];
    saleDetailsDiscount = json['SaleDetails_Discount'];
    discountAmount = json['Discount_amount'];
    saleDetailsTax = json['SaleDetails_Tax'];
    saleDetailsTotalAmount = json['SaleDetails_TotalAmount'];
    status = json['Status'];
    addBy = json['AddBy'];
    addTime = json['AddTime'];
    updateBy = json['UpdateBy'];
    updateTime = json['UpdateTime'];
    saleDetailsBranchId = json['SaleDetails_BranchId'];
    productName = json['Product_Name'];
    productCategoryName = json['ProductCategory_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleDetails_SlNo'] = this.saleDetailsSlNo;
    data['SaleMaster_IDNo'] = this.saleMasterIDNo;
    data['Product_IDNo'] = this.productIDNo;
    data['SaleDetails_TotalQuantity'] = this.saleDetailsTotalQuantity;
    data['Purchase_Rate'] = this.purchaseRate;
    data['SaleDetails_Rate'] = this.saleDetailsRate;
    data['SaleDetails_Discount'] = this.saleDetailsDiscount;
    data['Discount_amount'] = this.discountAmount;
    data['SaleDetails_Tax'] = this.saleDetailsTax;
    data['SaleDetails_TotalAmount'] = this.saleDetailsTotalAmount;
    data['Status'] = this.status;
    data['AddBy'] = this.addBy;
    data['AddTime'] = this.addTime;
    data['UpdateBy'] = this.updateBy;
    data['UpdateTime'] = this.updateTime;
    data['SaleDetails_BranchId'] = this.saleDetailsBranchId;
    data['Product_Name'] = this.productName;
    data['ProductCategory_Name'] = this.productCategoryName;
    return data;
  }
}
