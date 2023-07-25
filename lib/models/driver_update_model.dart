class DriverUpdateModel {
  bool? status;
  String? message;
  Data? data;

  DriverUpdateModel({this.status, this.message, this.data});

  DriverUpdateModel.fromJson(Map<String, dynamic> json) {
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
  String? dob;
  String? ppsNo;
  String? vehicleType;
  String? address;
  String? vehicleName;
  String? vehicleModel;
  String? vehicleMake;
  String? vehicleColor;
  String? ppsCardImage;
  String? licenceFrontImage;
  String? licenceBackImage;

  Data(
      {this.dob,
        this.ppsNo,
        this.vehicleType,
        this.address,
        this.vehicleName,
        this.vehicleModel,
        this.vehicleMake,
        this.vehicleColor,
        this.ppsCardImage,
        this.licenceFrontImage,
        this.licenceBackImage});

  Data.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    ppsNo = json['pps_no'];
    vehicleType = json['vehicle_type'];
    address = json['address'];
    vehicleName = json['vehicle_name'];
    vehicleModel = json['vehicle_model'];
    vehicleMake = json['vehicle_make'];
    vehicleColor = json['vehicle_color'];
    ppsCardImage = json['pps_card_image'];
    licenceFrontImage = json['licence_front_image'];
    licenceBackImage = json['licence_back_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['pps_no'] = this.ppsNo;
    data['vehicle_type'] = this.vehicleType;
    data['address'] = this.address;
    data['vehicle_name'] = this.vehicleName;
    data['vehicle_model'] = this.vehicleModel;
    data['vehicle_make'] = this.vehicleMake;
    data['vehicle_color'] = this.vehicleColor;
    data['pps_card_image'] = this.ppsCardImage;
    data['licence_front_image'] = this.licenceFrontImage;
    data['licence_back_image'] = this.licenceBackImage;
    return data;
  }
}
