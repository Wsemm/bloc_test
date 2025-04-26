import 'package:bloc_test/features/home_data/data/datasources/post_remote_data_source.dart';
import 'package:bloc_test/features/home_data/data/repositories/post_repository_impl.dart';
import 'package:bloc_test/features/home_data/domain/repositories/post_repository.dart';
import 'package:bloc_test/features/home_data/domain/usecases/get_post.dart';
import 'package:bloc_test/features/home_data/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! Features - Posts
  locator.registerFactory(() => PostBloc(getPosts: locator()));
  locator.registerLazySingleton(() => GetPosts(locator()));
  locator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(dioClient: locator()));

  //! Core
  locator.registerLazySingleton(() => DioClient(Dio()));
}
