part of 'user_bloc.dart';

abstract class UserDetailsEvent{}

class UserInfo extends UserDetailsEvent{
  final UserDetails userDetails;
  UserInfo({required this.userDetails});
  
}