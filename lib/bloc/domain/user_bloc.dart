import 'dart:async';
import 'package:azodha_contact_form/firebase_service.dart';
import 'package:bloc/bloc.dart';
import '../data/model/UserDetails.dart';
import 'package:meta/meta.dart';

part './user_state.dart';
part 'user_event.dart';


class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
   final FirebaseService firebaseService;
  UserDetailsBloc({required this.firebaseService}) : super(UserDetailsInitial());


  UserDetailsState get initialState => UserDetailsInitial();
  
  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async* {
     try{if (event is UserInfo) {
      await firebaseService.submitForm(event.userDetails);
      yield UserDetailsSubmitted();
    }
    else{
      yield UserDetailsLoading();
      final userDetails = await firebaseService.getUserDetails();
      yield UserDetailsLoaded(userDetails: userDetails);
    }
     }catch(e)
     {
       yield UserDetailsFailure(error: e.toString());
     }
    }
  }
