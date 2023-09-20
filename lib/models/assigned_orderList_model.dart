class assgnedOrderList {
  bool? status;
  String? message;
  List<Data>? data;

  assgnedOrderList({this.status, this.message, this.data});

  assgnedOrderList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic date;
  dynamic orderId;
  dynamic paymentMethod;
  dynamic orderTotal;
  dynamic orderStatus;
  dynamic accpetanceStatus;
  Location? location;

  Data(
      {this.date,
        this.orderId,
        this.paymentMethod,
        this.accpetanceStatus,
        this.orderTotal,
        this.orderStatus,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderId = json['order_id'];
    paymentMethod = json['payment_method'];
    orderTotal = json['order_total'];
    orderStatus = json['order_status'];
    accpetanceStatus = json['accpetance_status'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['order_id'] = this.orderId;
    data['payment_method'] = this.paymentMethod;
    data['order_total'] = this.orderTotal;
    data['accpetance_status'] = this.accpetanceStatus;
    data['order_status'] = this.orderStatus;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  dynamic id;
  dynamic userId;
  dynamic latitude;
  dynamic longitude;
  dynamic location;
  dynamic flatNo;
  dynamic landmark;
  dynamic addressType;
  dynamic createdAt;
  dynamic updatedAt;
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
