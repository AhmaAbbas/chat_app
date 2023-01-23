class Register_States{}
class RegsiterInitial extends Register_States{}
class RegsiterLoading extends Register_States{}
class RegsiterSucces  extends  Register_States{}
class RegsiterFailure extends Register_States{
  String errormassege;
  RegsiterFailure({required this.errormassege});
}