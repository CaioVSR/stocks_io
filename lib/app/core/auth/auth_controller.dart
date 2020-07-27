import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/core/auth/repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository;

  _AuthControllerBase(this._authRepository);

  @action
  Future<bool> loginWithEmail({String email, String password}) async {
    return await _authRepository.loginWithEmail(email: email, password: password);
  }
}
