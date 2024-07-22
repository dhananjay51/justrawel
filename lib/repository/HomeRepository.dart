import 'dart:math';
import 'package:justwravel/models/best_packing_model.dart';
import 'package:justwravel/models/best_sellers_model.dart';
import 'package:justwravel/models/home_category_model.dart';
import 'package:justwravel/models/internation_package_model.dart';
import 'package:justwravel/models/video_model.dart';
import '../data/network/AppUrl.dart';
import '../data/network/NetworkApiServices.dart';
import '../models/up_coming_trips_model.dart';
import 'package:justwravel/models/home_category_grid_model.dart';
import 'package:justwravel/models/trek_model.dart';
import 'package:justwravel/models/best_packing_model.dart';
import 'package:justwravel/models/google_review_model.dart';
import 'package:justwravel/models/video_model.dart';
import 'package:justwravel/models/package_detail_lists_models.dart';
import 'package:justwravel/models/filter_via_category_model.dart';
import 'package:justwravel/models/seoVideo_model.dart';
import 'package:justwravel/models/custom_package_model.dart';
import 'package:justwravel/models/package_details_model.dart';
import 'package:justwravel/models/best_packing_category.dart';


class HomeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<CategorytModel> getCategory() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.category);

      return response = CategorytModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
   }
  Future<CategoriesGrid> getCategories(String id) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.homepagecategories + id);

      return response = CategoriesGrid.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<UpComingTripsModel> getUpcomingTrips(String selectvalue) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.upcomingTrips + selectvalue);

      return response = UpComingTripsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<BestsSellersModel> getBestSellers() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.bestSellers);

      return response = BestsSellersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<TreksModel> getTreck() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.treks);

      return response = TreksModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<BestPackingModel> getBestPacking() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.backpackingtrips);

      return response = BestPackingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PackageModel> getPackageTrips() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.internationalTrips);

      return response = PackageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<PackageModel> getDomesticTrip() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.domestictrips);

      return response = PackageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<GoogleReviewModel> getGoogleReview() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.googleReviewUrl);
      return response = GoogleReviewModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<VideoModel> geVideo() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.videoUrl);
      return response = VideoModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PackageViewAllModel> getPackageViewAll(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = PackageViewAllModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<FilterViaModel> getFilterCategory(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = FilterViaModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<SeoModel> getSeoVideoList(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = SeoModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<CustomPackageModel>getCustomPackageList(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = CustomPackageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<BackPackingCategory>getbackPackingCategory(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = BackPackingCategory.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<PackageDetail>getPackageDetail(String url) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(url);
      return response = PackageDetail.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}
