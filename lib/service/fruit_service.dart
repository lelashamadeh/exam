
import 'package:dio/dio.dart';
import 'package:examflutterui/model/fruit_salad_model.dart';

class FruitService {
  final Dio dio = Dio();
  late Response response;

  Future<List<FruitSaladModel>> getmeal() async{
    try {
      response =await dio .get("https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian");
      // List<FruitSaladModel>fruits =[];
      // for (var i=0 ;i<response.data['meals'].length;i++){
      // }
      return  List<FruitSaladModel>.from(
      response.data['meals'].map((meals) => FruitSaladModel.fromJson(meals)));
    } catch (e) {
      print(e);
      return [];
    }
  }
  
}