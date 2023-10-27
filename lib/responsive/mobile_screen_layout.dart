import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

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
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final User? user = Provider.of<UserProvider>(context).getUser;

    return
        // user == null
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     :
        Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          onTap: navigationTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.hexagon_outlined,
                color: _page == 0 ? Colors.pink : const Color(0xff666666),
              ),
              label: 'Prompt',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.image_outlined,
                color: _page == 1 ? Colors.pink : const Color(0xff666666),
              ),
              label: 'Image',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.save_alt_outlined,
                color: _page == 2 ? Colors.pink : const Color(0xff666666),
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.workspace_premium,
                color: _page == 3 ? Colors.pink : const Color(0xff666666),
              ),
              label: 'Premium',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _page == 4 ? Colors.pink : const Color(0xff666666),
              ),
              label: 'Settings',
            ),
          ]),
    );
  }
}
