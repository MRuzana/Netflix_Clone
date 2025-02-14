import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/fast_laughs/fast_laughs.dart';
import 'package:netflix_app/presentation/downloads/new_and_hot/new_and_hot.dart';
import 'package:netflix_app/presentation/downloads/search/screen_search.dart';
import 'package:netflix_app/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';


class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    const ScreenDownloads(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier, 
          builder: (context,int index,_){
            return pages[index];
          }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}