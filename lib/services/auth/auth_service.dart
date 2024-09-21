import 'package:learningdart/services/auth/auth_provider.dart';
import 'package:learningdart/services/auth/auth_user.dart';

class AuthService implements AuthProvider{
  final AuthProvider provider;
  AuthService(this.provider);

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
          email: email,
          password: password
      );

  @override
  // implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) => provider.logIn(
      email: email,
      password: password,);

  @override
  Future<void> logOut()
    // implement logOut
    => provider.logOut();


  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
    // implement sendEmailVerification
}

//I stopped at 15:51:01
