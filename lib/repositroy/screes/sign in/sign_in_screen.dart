import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_controller.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_state.dart';

import '../../widget/ui_helper.dart';
import '../home/home_screen.dart';
import '../sign up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomText(
                text: "Login here",
                fontsize: 25.sp,
                fontfamily: "Bold",
                color: const Color(0XFF213BC5),
              ),
              SizedBox(height: 10.h),
              UiHelper.CustomText(
                text: "Welcome back you’ve ",
                fontsize: 18.sp,
                fontfamily: "Bold",
              ),
              UiHelper.CustomText(
                text: "been missed!",
                fontsize: 18.sp,
                fontfamily: "Bold",
              ),
              SizedBox(height: 30.h),
              UiHelper.CustomTextField(
                emailController,
                "Email",
                false,
                TextInputType.emailAddress,
              ),
              SizedBox(height: 10.h),
              UiHelper.CustomTextField(
                passwordController,
                "Password",
                true,
                TextInputType.visiblePassword,
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.only(right: 22.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UiHelper.CustomTextButton(
                      callback: () {},
                      text: "Forgot your password?",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              BlocConsumer<SignInBloc, SignInStates>(
                listener: (context, state) {
                  if (state is SignInLoadedStates) {
                    UiHelper.CustomSnackBar(
                      context,
                      state.signInModel.message.toString(),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else if (state is SignInErrorStates) {
                    UiHelper.CustomSnackBar(context, state.error.toString());
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoadingStates) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return UiHelper.CustomButton(
                    callback: () {
                      SignInController.signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        context: context,
                      );
                    },
                    text: "Sign In",
                  );
                },
              ),
              SizedBox(height: 10.h),
              UiHelper.CustomTextButton(
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                text: "create new account?",
                color: const Color(0XFF000000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
