import 'dart:ffi';

class BestsSellersModel {
  String? status;
  Data? data;
  String? message;

  BestsSellersModel({this.status, this.data, this.message});

  BestsSellersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<DataResult>? dataResult;

  Data({this.dataResult});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataResult = <DataResult>[];
      json['data'].forEach((v) {
        dataResult!.add(new DataResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataResult != null) {
      data['data'] = this.dataResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataResult {
  int? id;
  Category? category;
  List<Image>? image;
  String? title;
  String? slug;
  int? duration;
  String? startingFrom;
  String? endingTo;
  List<String>? batches;
  bool? isTrending;
  bool? isBestseller;
  String? trekDifficulty;
  DefaultPrice? defaultPrice;

  DataResult(
      {this.id,
        this.category,
        this.image,
        this.title,
        this.slug,
        this.duration,
        this.startingFrom,
        this.endingTo,
        this.batches,
        this.isTrending,
        this.isBestseller,
        this.trekDifficulty,
        this.defaultPrice});

  DataResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    startingFrom = json['starting_from'];
    endingTo = json['ending_to'];
    batches = json['batches'].cast<String>();
    isTrending = json['is_trending'];
    isBestseller = json['is_bestseller'];
    trekDifficulty = json['trek_difficulty'];
    defaultPrice = json['default_price'] != null
        ? new DefaultPrice.fromJson(json['default_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['duration'] = this.duration;
    data['starting_from'] = this.startingFrom;
    data['ending_to'] = this.endingTo;
    data['batches'] = this.batches;
    data['is_trending'] = this.isTrending;
    data['is_bestseller'] = this.isBestseller;
    data['trek_difficulty'] = this.trekDifficulty;
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
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

class Image {
  int? id;
  int? packageId;
  String? image;
  String ? caption;
  int? isMainBanner;
  String? mainBannerType;
  String ? order;
  String? createdAt;
  String? updatedAt;

  Image(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
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

class DefaultPrice {
  int? price;
  int? discountedPrice;

  DefaultPrice({this.price, this.discountedPrice});

  DefaultPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
  }
}
