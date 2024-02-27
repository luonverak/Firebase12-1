import 'package:demo_firebase11_12/home/model/product_model.dart';
import 'package:demo_firebase11_12/home/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> listProduct = <ProductModel>[].obs;
  RxBool loading = true.obs;
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future getProduct() async {
    try {
      var product = await ServiceProductAPI().fetchProductAPI();
      if (product != null) {
        listProduct.value = product;
      }
      loading(true);
    } finally {
      loading(false);
    }
    update();
  }
}
