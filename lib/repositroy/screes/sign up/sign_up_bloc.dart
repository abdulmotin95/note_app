import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20up/sign_up_sevent.dart';
import 'package:note_app/repositroy/screes/sign%20up/sign_up_state.dart';

import '../../../data/apihelper.dart';
import '../../../data/baseurl.dart';
import '../../../domains/model/sign_up_model.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  final ApiHelper apiHelper;

  SignUpBloc({required this.apiHelper}) : super(SignUpInitialStates()) {
    on<SignUpUserEvents>((event, emit) async {
      emit(SignUpLoadingStates());
      try {
        final responsedata = await apiHelper.postapi(
          url: BaseUrls.signup,
          bodyparams: {
            "email": event.email,
            "password": event.password,
            "username": event.username,
          },
        );

        final signupmodel = SignUpModel.fromJson(responsedata);
        emit(SignUpLoadedStates(signUpModel: signupmodel));
      } catch (ex) {
        emit(SignUpErrorStates(errormsg: ex.toString()));
      }
    });
  }
}
