import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/features/chat/chat_list.dart';
import 'package:leach/features/home/home_screen.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/posts/presentation/posts_screen.dart';
import 'package:leach/features/profile/presentation/pet_profile/pet_profile.dart';
import 'package:leach/features/profile/presentation/profile/profile.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  static int mainIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<MainScreenBloc>().add(const ChangeTabEvent(4));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
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
                                )),
                          ),
                        ),
                      ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  color: AppColors.primaryColor,
                  shape: const CircularNotchedRectangle(), //shape of notch
                  notchMargin: -15,
                  child: SizedBox(
                    height: AppSize.defaultSize! * 10,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: AppSize.defaultSize! * 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: IconButton(
                                focusColor: AppColors.greyColor,
                                hoverColor: AppColors.greyColor,
                                padding: EdgeInsets.zero,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  context
                                      .read<MainScreenBloc>()
                                      .add(const ChangeTabEvent(0));
                                },
                                icon: Image.asset(
                                  AssetPath.postsIcon,
                                  color: context.read<MainScreenBloc>() == '0'
                                      ? Colors.grey
                                      : Colors.white,
                                )),
                          ),
                          Center(
                            child: InkWell(
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context
                                      .read<MainScreenBloc>()
                                      .add(const ChangeTabEvent(1));
                                },
                                child: Image.asset(
                                  AssetPath.chat,
                                  width: AppSize.defaultSize! * 4,
                                  height: AppSize.defaultSize! * 4,
                                )),
                          ),
                          SizedBox(
                            width: AppSize.defaultSize! * 5,
                          ),
                          Center(
                            child: InkWell(
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context
                                      .read<MainScreenBloc>()
                                      .add(const ChangeTabEvent(2));
                                },
                                child: Image.asset(
                                  AssetPath.petProfile,
                                  width: AppSize.defaultSize! * 4,
                                  height: AppSize.defaultSize! * 4,
                                )),
                          ),
                          Center(
                            child: InkWell(
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context
                                      .read<MainScreenBloc>()
                                      .add(const ChangeTabEvent(3));
                                },
                                child: Image.asset(
                                  AssetPath.profile,
                                  width: AppSize.defaultSize! * 4,
                                  height: AppSize.defaultSize! * 4,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: BackgroundScreen(
                  image: AssetPath.homeBackground,
                  child: getScreen(selectedIndex),
                )),
          );
        });
      },
    );
  }

  Widget getScreen(int selectedIndex) {
    if (selectedIndex == 0) {
      return const PostsScreen();
    } else if (selectedIndex == 1) {
      return ChatList();
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
      return HomeScreen();
    }
  }
}
