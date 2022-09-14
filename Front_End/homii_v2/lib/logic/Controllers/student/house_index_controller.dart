import 'package:get/get.dart';
import 'package:homii_v2/component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/student_house_model.dart';
import '../../../service/repository/student_house_repo.dart';

class HouseIndexController extends GetxController {
  bool isLoad = false;
  late StudentHouseRepo studentHouseRepo;
  HouseIndexController({required this.studentHouseRepo});

  late List<Data> _productList = [];
  List<Data> get productList => _productList;

  Future<void> getHouseList() async {
    isLoad = true;
    Response response = await studentHouseRepo.getMyProductList();
    if (response.statusCode == 200) {
      isLoad = false;
      _productList = [];
      _productList.addAll(StudentHouseModel.fromJson(response.body).data);
      update();
    } else {
      ShowCustomSnackparRed('check internet connection', 'Error');
      isLoad = false;
      update();
    }
  }
}
