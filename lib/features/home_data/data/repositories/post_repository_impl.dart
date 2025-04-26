import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    final models = await remoteDataSource.getPosts();
    return models
        .map((model) => Post(id: model.id, title: model.title))
        .toList();
  }
}
