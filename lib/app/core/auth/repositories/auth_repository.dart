import 'package:stocks_io/app/core/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future loginWithEmail({String email, String password}) async {
    if (email == 'user@gmail.com' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }
}
