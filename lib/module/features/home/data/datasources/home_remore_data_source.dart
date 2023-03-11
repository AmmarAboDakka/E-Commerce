import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';
import 'package:e_commerce/module/features/home/data/models/home_model.dart';


abstract class HomeRemoreDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoreDataSourcewithApi extends HomeRemoreDataSource {
  final ApiCounsumer apiCounsumer;

  HomeRemoreDataSourcewithApi(this.apiCounsumer);
  @override
  Future<HomeModel> getHomeData() async {
    final response = await apiCounsumer.get(EndPoint.home);

    return HomeModel.fromJson(response.data);
  }
}
