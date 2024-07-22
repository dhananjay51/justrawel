
import 'dart:ffi';

class GoogleReviewModel {
  String? status;
  GoogleReviewModelData? data;
  String? message;

  GoogleReviewModel({this.status, this.data, this.message});

  GoogleReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new GoogleReviewModelData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class GoogleReviewModelData {
  List<GoogleReviewResult>? data;

  GoogleReviewModelData({this.data});

  GoogleReviewModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GoogleReviewResult>[];
      json['data'].forEach((v) {
        data!.add(new GoogleReviewResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoogleReviewResult {
  int? id;
  String? googleReviewId;
  String? googleReviewLink;
  String? authorName;
  String? authorImageUrl;
  String? reviewText;
  String? reviewRating;
  Package? package;

  GoogleReviewResult(
      {this.id,
        this.googleReviewId,
        this.googleReviewLink,
        this.authorName,
        this.authorImageUrl,
        this.reviewText,
        this.reviewRating,
        this.package});

  GoogleReviewResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleReviewId = json['google_review_id'];
    googleReviewLink = json['google_review_link'];
    authorName = json['author_name'];
    authorImageUrl = json['author_image_url'];
    reviewText = json['review_text'];
    reviewRating = json['review_rating'];
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['google_review_id'] = this.googleReviewId;
    data['google_review_link'] = this.googleReviewLink;
    data['author_name'] = this.authorName;
    data['author_image_url'] = this.authorImageUrl;
    data['review_text'] = this.reviewText;
    data['review_rating'] = this.reviewRating;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    return data;
  }
}

class Package {
  int? id;
  String? title;
  String? slug;
  Category? category;
  List<Imagelist>? image;
  String? stateName;
  String? countryName;

  Package(
      {this.id,
        this.title,
        this.slug,
        this.category,
        this.image,
        this.stateName,
        this.countryName});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['image'] != null) {
      image = <Imagelist>[];
      json['image'].forEach((v) {
        image!.add(new Imagelist.fromJson(v));
      });
    }
    stateName = json['state_name'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['state_name'] = this.stateName;
    data['country_name'] = this.countryName;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Imagelist {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  String? order;
  String? createdAt;
  String? updatedAt;

  Imagelist(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  Imagelist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    image = json['image'];
    caption = json['caption'];
    isMainBanner = json['is_main_banner'];
    mainBannerType = json['main_banner_type'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['image'] = this.image;
    data['caption'] = this.caption;
    data['is_main_banner'] = this.isMainBanner;
    data['main_banner_type'] = this.mainBannerType;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
