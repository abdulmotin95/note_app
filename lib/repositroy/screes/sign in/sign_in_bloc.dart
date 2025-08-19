import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_sevent.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_state.dart';

import '../../../data/apihelper.dart';
import '../../../data/baseurl.dart';
import '../../../domains/constans/app_prefs.dart';
import '../../../domains/model/sign_in_model.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  final ApiHelper apiHelper;

  SignInBloc({required this.apiHelper}) : super(SignInInitialStates()) {
    on<SignInUserEvents>((event, emit) async {
      emit(SignInLoadingStates());
      try {
        final responsedata = await apiHelper.postapi(
          url: BaseUrls.signin,
          bodyparams: {"email": event.email, "password": event.password},
        );

        final signinmodel = SignInModel.fromJson(responsedata);

        AppPrefs().setprefs(signinmodel.token.toString());
        AppPrefs().setBool(true);
        AppPrefs().setuserId(signinmodel.reponse!.sId.toString());

        emit(SignInLoadedStates(signInModel: signinmodel));
      } catch (ex) {
        emit(SignInErrorStates(error: ex.toString()));
      }
    });
  }
}
