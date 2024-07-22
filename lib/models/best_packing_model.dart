import 'dart:ffi';

class BestPackingModel {
  String? status;
  PackingData? data;
  String? message;

  BestPackingModel({this.status, this.data, this.message});

  BestPackingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PackingData.fromJson(json['data']) : null;
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

class PackingData {
  List<BestPackingData>? data;

  PackingData({this.data});

  PackingData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BestPackingData>[];
      json['data'].forEach((v) {
        data!.add(new BestPackingData.fromJson(v));
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

class BestPackingData {
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
  bool? isRecommended;
  String? trekDifficulty;
  DefaultPrice? defaultPrice;
  String? countryName;
  String? stateName;
  String? countrySlug;
  String? stateSlug;

  BestPackingData(
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
        this.isRecommended,
        this.trekDifficulty,
        this.defaultPrice,
        this.countryName,
        this.stateName,
        this.countrySlug,
        this.stateSlug});

  BestPackingData.fromJson(Map<String, dynamic> json) {
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
    isRecommended = json['is_recommended'];
    trekDifficulty = json['trek_difficulty'];
    defaultPrice = json['default_price'] != null
        ? new DefaultPrice.fromJson(json['default_price'])
        : null;
    countryName = json['country_name'];
    stateName = json['state_name'];
    countrySlug = json['country_slug'];
    stateSlug = json['state_slug'];
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
    data['is_recommended'] = this.isRecommended;
    data['trek_difficulty'] = this.trekDifficulty;
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['country_slug'] = this.countrySlug;
    data['state_slug'] = this.stateSlug;
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
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  String? order;
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
  Null? discountedPrice;

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
