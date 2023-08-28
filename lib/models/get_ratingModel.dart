class RatingModel {
  bool? status;
  String? message;
  Data? data;

  RatingModel({this.status, this.message, this.data});

  RatingModel.fromJson(Map<String, dynamic> json) {
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
  List<ReviewsList>? reviewsList;
  String? avgRating;
  List<TotalReviews>? totalReviews;
  int? reviewsCount;

  Data(
      {this.reviewsList, this.avgRating, this.totalReviews, this.reviewsCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reviewsList'] != null) {
      reviewsList = <ReviewsList>[];
      json['reviewsList'].forEach((v) {
        reviewsList!.add(new ReviewsList.fromJson(v));
      });
    }
    avgRating = json['avg_rating'];
    if (json['totalReviews'] != null) {
      totalReviews = <TotalReviews>[];
      json['totalReviews'].forEach((v) {
        totalReviews!.add(new TotalReviews.fromJson(v));
      });
    }
    reviewsCount = json['ReviewsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviewsList != null) {
      data['reviewsList'] = this.reviewsList!.map((v) => v.toJson()).toList();
    }
    data['avg_rating'] = this.avgRating;
    if (this.totalReviews != null) {
      data['totalReviews'] = this.totalReviews!.map((v) => v.toJson()).toList();
    }
    data['ReviewsCount'] = this.reviewsCount;
    return data;
  }
}

class ReviewsList {
  int? id;
  String? userName;
  String? profileImage;
  String? review;
  String? date;
  String? isDelivery;

  ReviewsList(
      {this.id, this.userName, this.profileImage, this.isDelivery, this.review, this.date});

  ReviewsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
    review = json['review'];
    isDelivery = json['is_delivery'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['is_delivery'] = this.isDelivery;
    data['profile_image'] = this.profileImage;
    data['review'] = this.review;
    data['date'] = this.date;
    return data;
  }
}

class TotalReviews {
  String? avg;
  String? title;
  bool? show;

  TotalReviews({this.avg, this.title, this.show});

  TotalReviews.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
    title = json['title'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['title'] = this.title;
    data['show'] = this.show;
    return data;
  }
}
