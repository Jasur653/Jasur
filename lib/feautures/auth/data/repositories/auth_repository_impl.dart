
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasoirces/auth_remote_data_sourse.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> signIn({required String username, required String password}) {
    return remoteDataSource.signIn(username: username, password: password);
  }
}