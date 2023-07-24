class DashboardModel {
  bool? status;
  String? message;
  Data? data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  bool? deliveryMode;
  int? deliveredOrders;
  int? pendingOrders;
  List<List1>? list;

  Data(
      {this.username,
        this.deliveryMode,
        this.deliveredOrders,
        this.pendingOrders,
        this.list});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    deliveryMode = json['delivery_mode'];
    deliveredOrders = json['deliveredOrders'];
    pendingOrders = json['pendingOrders'];
    if (json['list'] != null) {
      list = <List1>[];
      json['list'].forEach((v) {
        list!.add(new List1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['delivery_mode'] = this.deliveryMode;
    data['deliveredOrders'] = this.deliveredOrders;
    data['pendingOrders'] = this.pendingOrders;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class List1 {
  String? date;
  int? orderId;
  String? paymentMethod;
  int? orderTotal;
  Location? location;
  VendorLocation? vendorLocation;

  List1(
      {this.date,
        this.orderId,
        this.paymentMethod,
        this.orderTotal,
        this.location,
        this.vendorLocation});

  List1.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderId = json['order_id'];
    paymentMethod = json['payment_method'];
    orderTotal = json['order_total'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    vendorLocation = json['vendor_location'] != null
        ? new VendorLocation.fromJson(json['vendor_location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['order_id'] = this.orderId;
    data['payment_method'] = this.paymentMethod;
    data['order_total'] = this.orderTotal;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.vendorLocation != null) {
      data['vendor_location'] = this.vendorLocation!.toJson();
    }
    return data;
  }
}

class Location {
  int? id;
  int? userId;
  String? latitude;
  String? longitude;
  String? location;
  String? flatNo;
  String? landmark;
  String? addressType;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Location(
      {this.id,
        this.userId,
        this.latitude,
        this.longitude,
        this.location,
        this.flatNo,
        this.landmark,
        this.addressType,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    flatNo = json['flat_no'];
    landmark = json['landmark'];
    addressType = json['address_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['flat_no'] = this.flatNo;
    data['landmark'] = this.landmark;
    data['address_type'] = this.addressType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class VendorLocation {
  int? storeId;
  int? id;
  String? storeName;
  String? number;
  String? ppsNo;
  String? category;
  String? secondarycategory;
  String? tertiarycategory;
  String? collection;
  String? phone;
  String? storeImage;
  String? location;
  String? latitude;
  String? longitude;
  String? deliveryRange;
  String? ppsCardImage;
  String? remark;
  bool? status;

  VendorLocation(
      {this.storeId,
        this.id,
        this.storeName,
        this.number,
        this.ppsNo,
        this.category,
        this.secondarycategory,
        this.tertiarycategory,
        this.collection,
        this.phone,
        this.storeImage,
        this.location,
        this.latitude,
        this.longitude,
        this.deliveryRange,
        this.ppsCardImage,
        this.remark,
        this.status});

  VendorLocation.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    id = json['id'];
    storeName = json['store_name'];
    number = json['number'];
    ppsNo = json['pps_no'];
    category = json['category'];
    secondarycategory = json['secondarycategory'];
    tertiarycategory = json['tertiarycategory'];
    collection = json['collection'];
    phone = json['phone'];
    storeImage = json['storeImage'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deliveryRange = json['delivery_range'];
    ppsCardImage = json['pps_card_image'];
    remark = json['remark'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeId'] = this.storeId;
    data['id'] = this.id;
    data['store_name'] = this.storeName;
    data['number'] = this.number;
    data['pps_no'] = this.ppsNo;
    data['category'] = this.category;
    data['secondarycategory'] = this.secondarycategory;
    data['tertiarycategory'] = this.tertiarycategory;
    data['collection'] = this.collection;
    data['phone'] = this.phone;
    data['storeImage'] = this.storeImage;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['delivery_range'] = this.deliveryRange;
    data['pps_card_image'] = this.ppsCardImage;
    data['remark'] = this.remark;
    data['status'] = this.status;
    return data;
  }
}

//
// class DriverDeliveryOrderList {
//   bool? status;
//   String? message;
//   Data? data;
//
//   DriverDeliveryOrderList({this.status, this.message, this.data});
//
//   DriverDeliveryOrderList.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   dynamic deliveredOrders;
//   dynamic pendingOrders;
//   dynamic username;
//   dynamic deliveryMode;
//   List<List1>? list;
//
//   Data({this.deliveredOrders, this.pendingOrders, this.list});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     deliveredOrders = json['deliveredOrders'];
//     pendingOrders = json['pendingOrders'];
//     username = json['username'];
//     deliveryMode = json['delivery_mode'];
//     if (json['list'] != null) {
//       list = <List1>[];
//       json['list'].forEach((v) {
//         list!.add(List1.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['deliveredOrders'] = deliveredOrders;
//     data['pendingOrders'] = pendingOrders;
//     data['username'] = username;
//     data['delivery_mode'] = deliveryMode;
//     if (list != null) {
//       data['list'] = list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class List1 {
//   dynamic date;
//   dynamic orderId;
//   dynamic paymentMethod;
//   dynamic orderTotal;
//   Location? location;
//   VendorLocation? vendorLocation;
//   List1(
//       {this.date,
//         this.orderId,
//         this.paymentMethod,
//         this.orderTotal,
//         this.location,
//         this.vendorLocation
//       });
//
//   List1.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     orderId = json['order_id'];
//     paymentMethod = json['payment_method'];
//     orderTotal = json['order_total'];
//     location = json['location'] != null
//         ? Location.fromJson(json['location'])
//         : null;
//     vendorLocation = json['vendor_location'] != null
//         ? VendorLocation.fromJson(json['vendor_location'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['date'] = date;
//     data['order_id'] = orderId;
//     data['payment_method'] = paymentMethod;
//     data['order_total'] = orderTotal;
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     if (vendorLocation != null) {
//       data['vendor_location'] = vendorLocation!.toJson();
//     }
//     return data;
//   }
// }
//
// class Location {
//   int? id;
//   int? userId;
//   dynamic latitude;
//   dynamic longitude;
//   dynamic location;
//   dynamic flatNo;
//   dynamic street;
//   dynamic landmark;
//   dynamic addressType;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic deletedAt;
//
//   Location(
//       {this.id,
//         this.userId,
//         this.latitude,
//         this.longitude,
//         this.location,
//         this.flatNo,
//         this.street,
//         this.landmark,
//         this.addressType,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     location = json['location'];
//     flatNo = json['flat_no'];
//     street = json['street'];
//     landmark = json['landmark'];
//     addressType = json['address_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['location'] = location;
//     data['flat_no'] = flatNo;
//     data['street'] = street;
//     data['landmark'] = landmark;
//     data['address_type'] = addressType;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
//
//   String getAddress(){
//     String address = "";
//     List<String> temp = [];
//     if(flatNo != null && flatNo.toString().isNotEmpty){
//       temp.add(flatNo.toString());
//     }
//     if(street != null && street.toString().isNotEmpty){
//       temp.add(street.toString());
//     }
//     if(location != null && location.toString().isNotEmpty){
//       temp.add(location.toString());
//     }
//     address = temp.join(", ");
//     return address;
//   }
// }
//
// class VendorLocation {
//   int? id;
//   dynamic storeName;
//   dynamic phone;
//   dynamic storeImage;
//   dynamic address;
//   dynamic location;
//   dynamic latitude;
//   dynamic longitude;
//   dynamic aadharNo;
//   dynamic panNo;
//   dynamic deliveryRange;
//   dynamic bankStatement;
//   dynamic panCardImage;
//   dynamic aadharFrontImage;
//   dynamic aadharBackImage;
//   dynamic remark;
//   bool? status;
//
//   VendorLocation(
//       {this.id,
//         this.storeName,
//         this.phone,
//         this.storeImage,
//         this.address,
//         this.location,
//         this.latitude,
//         this.longitude,
//         this.aadharNo,
//         this.panNo,
//         this.deliveryRange,
//         this.bankStatement,
//         this.panCardImage,
//         this.aadharFrontImage,
//         this.aadharBackImage,
//         this.remark,
//         this.status});
//
//   VendorLocation.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     storeName = json['store_name'];
//     phone = json['phone'];
//     storeImage = json['storeImage'];
//     address = json['address'];
//     location = json['location'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     aadharNo = json['aadharNo'];
//     panNo = json['panNo'];
//     deliveryRange = json['delivery_range'];
//     bankStatement = json['bank_statement'];
//     panCardImage = json['pan_card_image'];
//     aadharFrontImage = json['aadhar_front_image'];
//     aadharBackImage = json['aadhar_back_image'];
//     remark = json['remark'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['store_name'] = this.storeName;
//     data['phone'] = this.phone;
//     data['storeImage'] = this.storeImage;
//     data['address'] = this.address;
//     data['location'] = this.location;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['aadharNo'] = this.aadharNo;
//     data['panNo'] = this.panNo;
//     data['delivery_range'] = this.deliveryRange;
//     data['bank_statement'] = this.bankStatement;
//     data['pan_card_image'] = this.panCardImage;
//     data['aadhar_front_image'] = this.aadharFrontImage;
//     data['aadhar_back_image'] = this.aadharBackImage;
//     data['remark'] = this.remark;
//     data['status'] = this.status;
//     return data;
//   }
// }