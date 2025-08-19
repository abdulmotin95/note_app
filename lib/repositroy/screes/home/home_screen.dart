
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domains/constans/random_colors.dart';
import 'add_note_screen.dart';
import 'fetch_note.dart';
import 'fetch_note_state.dart';

class HomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocBuilder<FetchNotesCubit, FetchNotesStates>(
          builder: (context, state) {
            if (state is FetchNotesLoadingStates) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchNotesLoadedStates) {
              return Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 80.h,
                        width: 80.w,
                        decoration: const BoxDecoration(),
                        child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Image.asset(
                              "assets/images/q.png",
                              height: 80.h,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                            EdgeInsets.only(left: 20.w, right: 20, top: 10),
                            child: Container(
                              height: 55,
                              width: 290,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: RandomColors.getRandomColor()),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    state.fetchNoteModel.data![index].note
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      "7:00",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.fetchNoteModel.data!.length),
                  )
                ],
              );
            } else if (state is FetchNotesErrorStates) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Center(
              child: Text("No Data Found!!"),
            );
          }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle the tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNotesScreen()));
        },
        backgroundColor: Color(0XFF213BC5),
        child: Icon(Icons.add),
      ),
    );
  }
}
