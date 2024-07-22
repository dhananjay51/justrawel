class UpComingTripsModel {
  String? status;
  DataResult? dataResult;
  String? message;

  UpComingTripsModel({this.status, this.dataResult, this.message});

  UpComingTripsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dataResult = json['data'] != null
        ? DataResult.fromJson(json['data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dataResult != null) {
      data['data'] = this.dataResult!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataResult {
  List<Data>? data;

  DataResult({this.data});

  DataResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  Category? category;
  List<Images>? image;
  String? title;
  String? slug;
  int? duration;
  String? startingFrom;
  String? endingTo;
  bool? isTrending;
  bool? isBestseller;
  String? trekDifficulty;
  DefaultPrice? defaultPrice;
  String? countryName;
  String? stateName;

  Data(
      {this.id,
      this.category,
      this.image,
      this.title,
      this.slug,
      this.duration,
      this.startingFrom,
      this.endingTo,
      this.isTrending,
      this.isBestseller,
      this.trekDifficulty,
      this.defaultPrice,
      this.countryName,
      this.stateName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['image'] != null) {
      image = <Images>[];
      json['image'].forEach((v) {
        image!.add(new Images.fromJson(v));
      });
    }
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    startingFrom = json['starting_from'];
    endingTo = json['ending_to'];
    isTrending = json['is_trending'];
    isBestseller = json['is_bestseller'];
    trekDifficulty = json['trek_difficulty'];
    defaultPrice = json['default_price'] != null
        ? DefaultPrice.fromJson(json['default_price'])
        : null;
    countryName = json['country_name'];
    stateName = json['state_name'];
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
    data['is_trending'] = this.isTrending;
    data['is_bestseller'] = this.isBestseller;
    data['trek_difficulty'] = this.trekDifficulty;
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
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

class Images {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  String? order;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.packageId,
      this.image,
      this.caption,
      this.isMainBanner,
      this.mainBannerType,
      this.order,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
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
