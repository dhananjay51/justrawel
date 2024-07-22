import 'package:flutter/cupertino.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/models/best_packing_model.dart';
import 'package:justwravel/models/best_sellers_model.dart';
import 'package:justwravel/models/internation_package_model.dart';
import 'package:justwravel/models/seoVideo_model.dart';
import '../data/response/ApiResponse.dart';
import '../models/up_coming_trips_model.dart';
import '../repository/HomeRepository.dart';
import 'package:justwravel/models/trek_model.dart';
import 'package:justwravel/models/best_packing_model.dart';
import 'package:justwravel/models/google_review_model.dart';
import 'package:justwravel/models/video_model.dart';
import 'package:justwravel/models/package_detail_lists_models.dart';
import 'package:justwravel/models/filter_via_category_model.dart';
import 'package:justwravel/models/custom_package_model.dart';
import 'package:justwravel/models/package_details_model.dart';
import 'package:justwravel/models/best_packing_category.dart';


class HomeViewViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<BestsSellersModel> bestSellerList = ApiResponse.loading();

  ApiResponse<UpComingTripsModel> upComingTripsList = ApiResponse.loading();
  ApiResponse<PackageModel> packageList = ApiResponse.loading();
  ApiResponse<TreksModel> treksList = ApiResponse.loading();
  ApiResponse<BestPackingModel> bestPackingList = ApiResponse.loading();
  ApiResponse<GoogleReviewModel> getgoogleReview = ApiResponse.loading();
  ApiResponse<VideoModel> getVideoList = ApiResponse.loading();
  ApiResponse<PackageViewAllModel> getPackageViewAllList = ApiResponse.loading();
  ApiResponse<FilterViaModel> getFiltetCategoryList = ApiResponse.loading();
  ApiResponse<SeoModel> getSeoVideoList = ApiResponse.loading();
  ApiResponse<CustomPackageModel> getCustomPackageList = ApiResponse.loading();
  ApiResponse<BackPackingCategory> getBackPackingCategories = ApiResponse.loading();
  ApiResponse<PackageDetail> getPackageDetails = ApiResponse.loading();

  setBestSellersList(ApiResponse<BestsSellersModel> response) {
    bestSellerList = response;
    notifyListeners();
  }

  setUpComingTripsList(ApiResponse<UpComingTripsModel> response) {
    upComingTripsList = response;
    notifyListeners();
  }
  setPackageTripsList(ApiResponse<PackageModel> response) {
    packageList = response;
    notifyListeners();
  }
  settreksList(ApiResponse<TreksModel> response) {
    treksList = response;
    notifyListeners();
  }
  setBestPackingList(ApiResponse<BestPackingModel> response) {
    bestPackingList = response;
    notifyListeners();
  }
  setGooggleReview(ApiResponse<GoogleReviewModel> response) {
    getgoogleReview = response;
    notifyListeners();
  }
  setVideoList(ApiResponse<VideoModel> response) {
    getVideoList = response;
    notifyListeners();
  }
  setViewAllPackageList(ApiResponse<PackageViewAllModel> response) {
    getPackageViewAllList = response;
    notifyListeners();
  }
  setFilterCategoryList(ApiResponse<FilterViaModel> response) {
    getFiltetCategoryList = response;
    notifyListeners();
  }
  setSeoVideoList(ApiResponse<SeoModel> response) {
    getSeoVideoList = response;
    notifyListeners();
  }
  setPackageList(ApiResponse<CustomPackageModel> response) {
    getCustomPackageList = response;
    notifyListeners();
  }

  setBackPackingCategory(ApiResponse<BackPackingCategory> response) {
    getBackPackingCategories = response;
    notifyListeners();
  }
  setPackageDetail(ApiResponse<PackageDetail> response) {
    getPackageDetails = response;
    notifyListeners();
  }


  Future<void> fetchBestSellersApi() async {
    await _homeRepo.getBestSellers().then((value) {
      setBestSellersList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setBestSellersList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchUpcomingTripsApi(String selectvalue) async {
    await _homeRepo.getUpcomingTrips(selectvalue).then((value) {
      setUpComingTripsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setUpComingTripsList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchTreksApi() async {
    await _homeRepo.getTreck().then((value) {
      settreksList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        settreksList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchBestPackingApi() async {
    await _homeRepo.getBestPacking().then((value) {
      setBestPackingList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        settreksList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchPackageApi() async {
    await _homeRepo.getPackageTrips().then((value) {
      setPackageTripsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setPackageTripsList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchDemosticApi() async {
    await _homeRepo.getDomesticTrip().then((value) {
      setPackageTripsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setPackageTripsList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchGoogleReViewApi() async {
    await _homeRepo.getGoogleReview().then((value) {
       setGooggleReview(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setGooggleReview(ApiResponse.error(error.toString())));
  }
  Future<void> fetchVedioApi() async {
    await _homeRepo.geVideo().then((value) {
      setVideoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setVideoList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchViewAllPackageApi(String url) async {
    await _homeRepo.getPackageViewAll(url).then((value) {
      setViewAllPackageList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setViewAllPackageList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchFiltetCategotyApi(String url) async {
    await _homeRepo.getFilterCategory(url).then((value) {
      setFilterCategoryList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setViewAllPackageList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchSeoVideoApi(String url) async {
    await _homeRepo.getSeoVideoList(url).then((value) {
      setSeoVideoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setSeoVideoList(ApiResponse.error(error.toString())));
     }
  Future<void> fetchCustomPackage(String url) async {
    await _homeRepo.getCustomPackageList(url).then((value) {
      setPackageList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setPackageList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchPackageDetail(String url) async {
    await _homeRepo.getCustomPackageList(url).then((value) {
      setPackageList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setPackageList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchBackPackingCategories(String url) async {
    await _homeRepo.getbackPackingCategory(url).then((value) {
      setBackPackingCategory(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setBackPackingCategory(ApiResponse.error(error.toString())));
  }
  Future<void> fetchPackingDetail(String url) async {
    await _homeRepo.getPackageDetail(url).then((value) {
      setPackageDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setBackPackingCategory(ApiResponse.error(error.toString())));
    }

   }
