import '../model/UserDetails.dart';
import '../provider/user_detail_provider.dart';

class UserDetailsRepository
{
  final UserDetailsProvider _userDetailsProvider = UserDetailsProvider();

  Future<UserDetails> fetchUserDetails() async  => _userDetailsProvider.fetchUserDetails();


  static Future<UserDetails> submitForm(UserDetails userDetails) async {
    await Future.delayed(Duration(seconds: 2));
    return userDetails;
  }
}

