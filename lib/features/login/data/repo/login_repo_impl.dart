import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/login/data/data_source/remote/remote_ds.dart';
import 'package:ecommerce/features/login/domain/domain_repo/login_repo.dart';
import 'package:ecommerce/features/signup/data/models/UserModel.dart';
import '../../../../core/error/failures.dart';
import '../data_source/local/local_ds.dart';

class LogInRepoImpl implements LogInRepo {
  LogInRemoteDataSource logInRemoteDataSource;
  LogInLocalDS localDS;

  LogInRepoImpl(this.logInRemoteDataSource, this.localDS);

  @override
  Future<Either<Failures, UserModel>> logIn(
      String email, String password) async {
    try {
      var result = await logInRemoteDataSource.login(email, password);
      if (result.isRight()) {
        result.fold((l) => null, (r) {
          cacheToken(r.token ?? "");
        });
      }
      return result;
    } catch (e) {
      throw (RemoteFailures("something went wrong"));
    }
  }

  void cacheToken(String token) async {
    await localDS.cacheToken(token);
  }
}
