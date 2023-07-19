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
  // List<Null>? list;

  Data(
      {this.username,
        this.deliveryMode,
        this.deliveredOrders,
        this.pendingOrders,
        // this.list
      });

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    deliveryMode = json['delivery_mode'];
    deliveredOrders = json['deliveredOrders'];
    pendingOrders = json['pendingOrders'];
    // if (json['list'] != null) {
    //   list = <Null>[];
    //   json['list'].forEach((v) {
    //     list!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['delivery_mode'] = this.deliveryMode;
    data['deliveredOrders'] = this.deliveredOrders;
    data['pendingOrders'] = this.pendingOrders;
    // if (this.list != null) {
    //   data['list'] = this.list!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
