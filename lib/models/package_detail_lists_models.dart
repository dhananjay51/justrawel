
import 'dart:ffi';

class PackageViewAllModel {
  String? status;
  PackageAllData? data;
  String? message;

  PackageViewAllModel({this.status, this.data, this.message});

  PackageViewAllModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PackageAllData.fromJson(json['data']) : null;
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

class PackageAllData {
  List<PackageViewAllResult>? data;
  Links? links;
  Meta? meta;

  PackageAllData({this.data, this.links, this.meta});

  PackageAllData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PackageViewAllResult>[];
      json['data'].forEach((v) {
        data!.add(new PackageViewAllResult.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class PackageViewAllResult {
  int? id;
  Category? category;
  List<ViewAllPackageImage>? image;
  String? pdfFile;
  String? title;
  String? slug;
  int? duration;
  String? startingFrom;
  String? endingTo;
  List<Batches>? batches;
  bool? isTrending;
  bool? isBestseller;
  bool? isRecommended;
  String? trekDifficulty;
  int? trekLength;
  int? altitude;
  DefaultPrice? defaultPrice;
  String? countryName;
  String? countrySlug;
  String? stateName;
  String? stateSlug;
  String? locationName;
  String? metaDescription;
  int? assignedTo;

  PackageViewAllResult(
      {this.id,
        this.category,
        this.image,
        this.pdfFile,
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
        this.trekLength,
        this.altitude,
        this.defaultPrice,
        this.countryName,
        this.countrySlug,
        this.stateName,
        this.stateSlug,
        this.locationName,
        this.metaDescription,
        this.assignedTo});

  PackageViewAllResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['image'] != null) {
      image = <ViewAllPackageImage>[];
      json['image'].forEach((v) {
        image!.add(new ViewAllPackageImage.fromJson(v));
      });
    }
    pdfFile = json['pdf_file'];
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    startingFrom = json['starting_from'];
    endingTo = json['ending_to'];
    if (json['batches'] != null) {
      batches = <Batches>[];
      json['batches'].forEach((v) {
        batches!.add(new Batches.fromJson(v));
      });
    }
    isTrending = json['is_trending'];
    isBestseller = json['is_bestseller'];
    isRecommended = json['is_recommended'];
    trekDifficulty = json['trek_difficulty'];
    trekLength = json['trek_length'];
    altitude = json['altitude'];
    defaultPrice = json['default_price'] != null
        ? new DefaultPrice.fromJson(json['default_price'])
        : null;
    countryName = json['country_name'];
    countrySlug = json['country_slug'];
    stateName = json['state_name'];
    stateSlug = json['state_slug'];
    locationName = json['location_name'];
    metaDescription = json['meta_description'];
    assignedTo = json['assigned_to'];
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
    data['pdf_file'] = this.pdfFile;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['duration'] = this.duration;
    data['starting_from'] = this.startingFrom;
    data['ending_to'] = this.endingTo;
    if (this.batches != null) {
      data['batches'] = this.batches!.map((v) => v.toJson()).toList();
    }
    data['is_trending'] = this.isTrending;
    data['is_bestseller'] = this.isBestseller;
    data['is_recommended'] = this.isRecommended;
    data['trek_difficulty'] = this.trekDifficulty;
    data['trek_length'] = this.trekLength;
    data['altitude'] = this.altitude;
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
    data['country_name'] = this.countryName;
    data['country_slug'] = this.countrySlug;
    data['state_name'] = this.stateName;
    data['state_slug'] = this.stateSlug;
    data['location_name'] = this.locationName;
    data['meta_description'] = this.metaDescription;
    data['assigned_to'] = this.assignedTo;
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

class ViewAllPackageImage {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  String? order;
  String? createdAt;
  String? updatedAt;

  ViewAllPackageImage(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  ViewAllPackageImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    image = json['image'];
    caption = json['caption'] ?? "";
    isMainBanner = json['is_main_banner'];
    mainBannerType = json['main_banner_type'];
    order = json['order'] ?? "";
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

class Batches {
  int? id;
  int? packageId;
  int? packageItineraryId;
  String? startdate;
  String? lastdate;
  int? availability;
  int? totalSlots;
  int? bookedSlots;
  String? createdAt;
  String? updatedAt;

  Batches(
      {this.id,
        this.packageId,
        this.packageItineraryId,
        this.startdate,
        this.lastdate,
        this.availability,
        this.totalSlots,
        this.bookedSlots,
        this.createdAt,
        this.updatedAt});

  Batches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    packageItineraryId = json['package_itinerary_id'];
    startdate = json['startdate'];
    lastdate = json['lastdate'];
    availability = json['availability'];
    totalSlots = json['total_slots'];
    bookedSlots = json['booked_slots'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['package_itinerary_id'] = this.packageItineraryId;
    data['startdate'] = this.startdate;
    data['lastdate'] = this.lastdate;
    data['availability'] = this.availability;
    data['total_slots'] = this.totalSlots;
    data['booked_slots'] = this.bookedSlots;
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

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev ?? "";
    data['next'] = this.next ?? "";
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<PackageLinksList>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <PackageLinksList>[];
      json['links'].forEach((v) {
        links!.add(new PackageLinksList.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class PackageLinksList {
  String? url;
  String? label;
  bool? active;

  PackageLinksList({this.url, this.label, this.active});

  PackageLinksList.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
