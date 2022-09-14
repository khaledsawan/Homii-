import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';

class StudentHouseRepo extends GetxService {
  late final ApiClient apiClient;

  StudentHouseRepo({required this.apiClient});

// Future<Response> GetProductList() async {
//   return await apiClient.getData(AppConstants.PRODUCT_URL);
// }
//
Future<Response> getMyProductList() async {
  return await apiClient.getData(AppConstants.STUDENTHOUSEINDEX);
}

// Future<Response> store(
//     List<int> img, String filename, ProductStoreModel productStoreModel) {
//   return apiClient.postProduct(
//       img, filename, AppConstants.PRODUCT_URL_STORE, productStoreModel);
// }

// Future<Response> destroy(ProductId productDestroy) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_DESTROY, productDestroy.toJson());
// }
//
// Future<Response> show(ProductId view_id) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_SHOW, view_id.toJson());
// }
//
// Future<Response> update(UpdateProductModel updateProductModel) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
// }
}
