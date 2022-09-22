import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/grocery_item.dart';

class GetBlockController extends GetxController {
  var Myvalue = 1.obs;

  var listofamount = List<int>.generate(demoItems.length, (i) => 1).obs;

  var priceList =
      List<double>.generate(demoItems.length, (i) => demoItems[i].price!).obs;

  Minus() {
    if (Myvalue >= 1) {
      Myvalue -= 1;
    } else {
      print('done');
    }
  }

  plusMethod() {
    Myvalue += 1;
  }

  String GetTotalAmount(double newprice) {
    double totalamount = (newprice * Myvalue.value);
    return totalamount.toStringAsFixed(1);
  }

  removeFromList(index, value) {
    if (listofamount[index] >= 1) {
      //[10,1,4,5,1]
      listofamount[index] -= 1;
    }
  }

  AddToList(index, value) {
    //[10,1,4,5,1]
    listofamount[index] += 1;
  }

  int ListAmount(index) {
    return (listofamount[index]);
  }

  double priceFromListItems(index) {
    priceList[index] = (listofamount[index] * demoItems[index].price!);
    return priceList[index];
  }

  double TotalCartAmout() {
    double sum =
        priceList.fold<double>(0, (double sum, double item) => sum + item);

    return sum;
  }
}
