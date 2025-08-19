import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20up/sign_up_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20up/sign_up_sevent.dart';

import '../../widget/ui_helper.dart';

class SignUpController {
  signupController({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) {
    if (email == "" || password == "" || username == "") {
      return UiHelper.CustomSnackBar(context, "Enter Required Field's");
    } else {
      BlocProvider.of<SignUpBloc>(context).add(
        SignUpUserEvents(email: email, password: password, username: username),
      );
    }
  }
}
