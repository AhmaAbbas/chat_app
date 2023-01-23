class Login_states{}
class LoginInitial extends Login_states{}
class LoginLoading extends Login_states{}
class LoginSuccsec extends Login_states{}
class LoginFailure extends Login_states{
  String errormassege;
  LoginFailure({required this.errormassege});
}

