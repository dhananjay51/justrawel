
import '../data/network/AppUrl.dart';
import '../data/network/NetworkApiServices.dart';
import 'package:justwravel/models/login_model.dart';


class LoginRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<LoginModel> postLogin(LoginUser postData) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.login, postData);

      return response = LoginModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
  class LoginUser {
    final String mobileno;
    final String country_Code;

    LoginUser({required this.mobileno, required this.country_Code});

    Map<String, dynamic> toJson() {
      return {
        'phoneno': mobileno,
        'country_code': country_Code,
      };
    }

  }