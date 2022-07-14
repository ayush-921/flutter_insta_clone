import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/utils/colors.dart';
import 'package:flutter_insta_clone/utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigatationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItem,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      /*appBar: AppBar(
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: primaryColor,
          height: 40,
        ),
        backgroundColor: mobileBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                color: primaryColor,
              ))
        ],
      ),*/
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_outline_outlined,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),*/

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigatationTapped,
      ),
    );
  }
}
