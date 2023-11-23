import 'package:ivally_task/app/data/network/http_helper/http_helper.dart';
import 'package:ivally_task/app/model/car_model.dart';
import 'package:ivally_task/app/model/response_handler_model.dart';
import 'package:ivally_task/utilities/constants/end_points.dart';

class CarApis {
  static Future<ResponseHandlerClass> getAllAvilableCar(
      {required int pageNumber}) async {
    CarModel carModel = CarModel(pageNumber: pageNumber);
    return await HttpHelper.postData(
      functionName: "getAllAvilableCar",
      path: EndPoints.allAvilableCar,
      body: carModel.toJson(),
    );
  }
}
