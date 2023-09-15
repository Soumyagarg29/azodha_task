part of 'user_bloc.dart';

abstract class UserDetailsState {} //abstract class 

class UserDetailsInitial extends UserDetailsState {} //initial state

class UserDetailsLoading extends UserDetailsState {} //show some loading animations 


class UserDetailsLoaded extends UserDetailsState{
List<UserDetails> userDetails;
UserDetailsLoaded({required this.userDetails});}//write after fetch


class UserDetailsSubmitted extends UserDetailsState{}


class UserDetailsFailure extends UserDetailsState{
  final String error;
  UserDetailsFailure({required this.error});
}


