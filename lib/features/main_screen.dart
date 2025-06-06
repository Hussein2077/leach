import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/chat/chat_list.dart';
import 'package:leach/features/home/presentation/home_screen.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/posts/presentation/posts_screen.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/pet_profile/pet_profile.dart';
import 'package:leach/features/profile/presentation/profile/profile.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    this.selectedIndex = 4,
  });

  final int selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {

    context.read<MainScreenBloc>().add(ChangeTabEvent(widget.selectedIndex));

    super.initState();
  }
  Future<bool> _willPopCallback() async {
  Methods.instance.showAlertDialog(context, title:  "Confirm Exit" , onPressed: () {
    SystemNavigator.pop();
  });
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          final selectedIndex =
              state is TabChangedState ? state.selectedIndex : 4;
          return LayoutBuilder(builder: (context, constraints) {
            final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: isKeyboardOpen
                    ? null
                    : Material(
                        elevation: 0,
                        shape: const CircleBorder(),
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize! * .8),
                          child: Container(
                            width: AppSize.defaultSize! * 8,
                            height: AppSize.defaultSize! * 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                context
                                    .read<MainScreenBloc>()
                                    .add(const ChangeTabEvent(4));
                              },
                              elevation: 0,
                              focusElevation: 0,
                              backgroundColor: AppColors.primaryColor,
                              shape: const CircleBorder(),
                              disabledElevation: 0,
                              label: Image.asset(
                                AssetPath.home,
                                width: AppSize.defaultSize! * 6,
                                height: AppSize.defaultSize! * 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  color: AppColors.primaryColor,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: -15,
                  child: SizedBox(
                    height: AppSize.defaultSize! * 9, // Reduced height
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildNavItem(
                          icon: AssetPath.postsIcon,
                          isSvg: false,
                          isSelected: selectedIndex == 0,
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(const ChangeTabEvent(0)),
                        ),
                        _buildNavItem(
                          icon: AssetPath.chat2,
                          isSelected: selectedIndex == 1,
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(const ChangeTabEvent(1)),
                        ),
                        SizedBox(width: AppSize.defaultSize! * 5),
                        _buildNavItem(
                          icon: AssetPath.petProfile2,
                          isSelected: selectedIndex == 2,
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(const ChangeTabEvent(2)),
                        ),
                        _buildNavItem(
                          icon: AssetPath.profile2,
                          isSelected: selectedIndex == 3,
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(const ChangeTabEvent(3)),
                        ),
                      ],
                    ),
                  ),
                ),
                body: BackgroundScreen(
                  image: AssetPath.homeBackground,
                  child:  getScreen(selectedIndex)
                ),
              ),
            );
          });
        },
      ),
    );
  }



  Widget _buildNavItem({
    required String icon,
    required bool isSelected,
    required Function() onTap,
    bool isSvg = true, // New parameter to distinguish between Image and Svg
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            focusColor: AppColors.greyColor,
            hoverColor: AppColors.greyColor,
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            onPressed: onTap,
            icon: isSvg
                ? SvgPicture.asset(
                    icon,
                    color: Colors.white,
                    width: AppSize.defaultSize! * 3.5,
                    height: AppSize.defaultSize! * 3.5,
                  )
                : Image.asset(
                    icon,
                    color: Colors.white,
                    width: AppSize.defaultSize! * 4,
                    height: AppSize.defaultSize! * 4,
                  ),
          ),
          if (isSelected)
            Container(
              height: 3,
              width: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget getScreen(int selectedIndex) {
    if (selectedIndex == 0) {
      return const PostsScreen();
    } else if (selectedIndex == 1) {
      return const ChatList();
    } else if (selectedIndex == 2) {
      return const BackgroundScreen(
        image: AssetPath.homeBackground,
        child: PetProfile(),
      );
    } else if (selectedIndex == 3) {
      return const BackgroundScreen(
        image: AssetPath.homeBackground,
        child: PersonalProfile(),
      );
    } else {
      return const HomeScreen();
    }
  }
}
