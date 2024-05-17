import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/ui/config/app_path.dart';
import 'package:base_flutter/ui/config/key.dart';
import 'package:base_flutter/ui/enum/bottom_tab_enum.dart';
import 'package:base_flutter/ui/router/app_navigator_impl.dart';
import 'package:base_flutter/ui/screen/main/cubit/main_cubit.dart';
import 'package:base_flutter/ui/share/scaffold/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage, MainCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: AutoTabsScaffold(
          routes: (navigator as AppNavigatorImpl).tabRoutes,
          scaffoldKey: AppKey.mainPageScaffoldKey,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBuilder: (_, tabsRouter) {
            (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;
            return BottomAppBar(
              color: Colors.white,
              shape: const CircularNotchedRectangle(),
              notchMargin: 5.0,
              elevation: 0,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  backgroundColor: Colors.transparent,
                  currentIndex: tabsRouter.activeIndex,
                  selectedFontSize: 12.sp,
                  selectedItemColor: const Color(0xffFB4145),
                  onTap: (index) {
                    // if (index == 4) {
                    //   AppKey.mainPageScaffoldKey.currentState!.openDrawer();
                    // } else {
                    if (index == tabsRouter.activeIndex) {
                      (navigator).popUntilRootOfCurrentBottomTab();
                    }
                    tabsRouter.setActiveIndex(index);
                    // }
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: BottomTab.values[0].title,
                      icon: Image.asset(
                        BottomTab.values[0].icon,
                        width: 30.w,
                        height: 30.w,
                      ),
                      activeIcon: Image.asset(
                        BottomTab.values[0].activeIcon,
                        width: 30.w,
                        height: 30.w,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: BottomTab.values[1].title,
                      icon: Image.asset(
                        BottomTab.values[1].icon,
                        width: 30.w,
                        height: 30.w,
                      ),
                      activeIcon: Image.asset(
                        BottomTab.values[1].activeIcon,
                        width: 30.w,
                        height: 30.w,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: BottomTab.values[2].title,
                      icon: Image.asset(
                        BottomTab.values[2].icon,
                        width: 30.w,
                        height: 30.w,
                      ),
                      activeIcon: Image.asset(
                        BottomTab.values[2].activeIcon,
                        width: 30.w,
                        height: 30.w,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: BottomTab.values[3].title,
                      icon: Image.asset(
                        BottomTab.values[3].icon,
                        width: 30.w,
                        height: 30.w,
                      ),
                      activeIcon: Image.asset(
                        BottomTab.values[3].activeIcon,
                        width: 30.w,
                        height: 30.w,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: BottomTab.values[4].title,
                      icon: Image.asset(
                        BottomTab.values[4].icon,
                        width: 30.w,
                        height: 30.w,
                      ),
                      activeIcon: Image.asset(
                        BottomTab.values[4].activeIcon,
                        width: 30.w,
                        height: 30.w,
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
