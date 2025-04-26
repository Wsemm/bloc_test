import 'package:bloc_test/features/home_data/data/models/posts_mode.dart';

import '../../../../core/network/dio_client.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient dioClient;

  PostRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<PostModel>> getPosts() async {
    final response =
        await dioClient.get('https://jsonplaceholder.typicode.com/posts');
    List<PostModel> posts = (response.data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
    return posts;
  }
}
