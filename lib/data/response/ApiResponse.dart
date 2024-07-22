import 'package:justwravel/data/response/api_status.dart';

class ApiResponse<T> {
  ApiStatus? apiStatus;
  T? data;
  String? message;

  ApiResponse(this.apiStatus, this.data, this.message);

  ApiResponse.loading() : apiStatus = ApiStatus.LOADING;

  ApiResponse.completed(this.data) : apiStatus = ApiStatus.COMPLETED;

  ApiResponse.error(this.message) : apiStatus = ApiStatus.ERROR;

  @override
  String toString() {
    return "Status: $apiStatus \n Message:$message \n Data: $data";
  }
}
