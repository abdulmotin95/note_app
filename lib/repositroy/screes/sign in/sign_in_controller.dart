import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_sevent.dart';

import '../../widget/ui_helper.dart';

class SignInController {
  static signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    if (email == "" || password == "") {
      return UiHelper.CustomSnackBar(context, "Enter Required Field's");
    } else {
      BlocProvider.of<SignInBloc>(
        context,
      ).add(SignInUserEvents(email: email, password: password));
    }
  }
}
