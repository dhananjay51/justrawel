class VideoModel {
  String? status;
  VideoData? data;
  String? message;

  VideoModel({this.status, this.data, this.message});

  VideoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new VideoData.fromJson(json['data']) : null;
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

class VideoData {
  List<String>? videos;
  List<Packages>? packages;

  VideoData({this.videos, this.packages});

  VideoData.fromJson(Map<String, dynamic> json) {
    videos = json['videos'].cast<String>();
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videos'] = this.videos;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? title;
  String? slug;
  Category? category;
  String? stateName;
  String? countryName;
  List<BannerImage>? bannerImage;

  Packages(
      {this.id,
        this.title,
        this.slug,
        this.category,
        this.stateName,
        this.countryName,
        this.bannerImage});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    stateName = json['state_name'];
    countryName = json['country_name'];
    if (json['banner_image'] != null) {
      bannerImage = <BannerImage>[];
      json['banner_image'].forEach((v) {
        bannerImage!.add(new BannerImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['state_name'] = this.stateName;
    data['country_name'] = this.countryName;
    if (this.bannerImage != null) {
      data['banner_image'] = this.bannerImage!.map((v) => v.toJson()).toList();
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

class BannerImage {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  String? order;
  String? createdAt;
  String? updatedAt;

  BannerImage(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  BannerImage.fromJson(Map<String, dynamic> json) {
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
