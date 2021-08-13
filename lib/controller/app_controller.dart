import 'package:aieone_flutter_task/model/data_model.dart';
import 'package:aieone_flutter_task/service/services.dart';
import 'package:get/get.dart';

class AppController extends GetxController{

  var getData = <DataModel>[].obs;
  Services services = Services();
  var dataLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  callpostmethod() async {
    try {
      dataLoading.value = true;
      var result = await services.getData();
      if (result != null) {
        getData.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      dataLoading.value = false;
    }
    update();
  }

}