import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:movies_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:movies_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:movies_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/core/utils/api_service.dart';

var getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: ApiService(
          Dio(),
        ),
      ),
    ),
  );
}
