import 'dart:async';
import 'package:bloc/bloc.dart';
import '../data/model/UserDetails.dart';
import '../data/repository/form_repository.dart';
import 'package:meta/meta.dart';

part './user_state.dart';
part 'user_event.dart';


class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserDetailsRepository userDetailsRepository;

  UserDetailsBloc({required this.userDetailsRepository}) : super(UserDetailsInitial() );

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async* {
    if (event is UserDetailsInitial) {
      yield UserDetailsLoading();
      try {
        UserDetails userDetails = await UserDetailsRepository().fetchUserDetails();
        await UserDetailsRepository.submitForm(userDetails);
        yield UserDetailsLoaded(userDetails: userDetails);
      } catch (e) {
        yield UserDetailsFailure(error: e.toString());
      }
    }
  }
}