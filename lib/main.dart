import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/repositroy/screes/home/add_note_bloc.dart';
import 'package:note_app/repositroy/screes/home/fetch_note.dart';
import 'package:note_app/repositroy/screes/home/home_screen.dart';
import 'package:note_app/repositroy/screes/sign%20in/sign_in_bloc.dart';
import 'package:note_app/repositroy/screes/sign%20up/sign_up_bloc.dart';
import 'package:note_app/repositroy/screes/splash/splash_screen.dart';

import 'data/apihelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignUpBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => SignInBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => AddNoteBloc(apiHelper: ApiHelper())),
          BlocProvider(
              create: (_) =>
              FetchNotesCubit(apiHelper: ApiHelper())..fetchNotes())
        ],
        child: MaterialApp(
            title: 'My Notes App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0XFF213BC5)),
                useMaterial3: false,
                fontFamily: "Regular"),
            home: HomeScreen()),
      ),
    );
  }
}