import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: Column(
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.defaultSize! * 3.4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LeadingIcon(
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: Image.asset(AssetPath.menuFriend),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    const ProfileUserRow(friendsView: true,),
                    SizedBox(
                      height: AppSize.defaultSize!,
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: AppSize.defaultSize! * 0.2,
                      indent: AppSize.defaultSize! * 2,
                      endIndent: AppSize.defaultSize! * 2,
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    SizedBox(
                      width: AppSize.screenWidth! * .7,
                      child: CustomText(
                        text:
                            '''Pet parent to German Shepherd, Kiwi. Enjoys park walks and adventures with Kiwi.''',
                        fontSize: AppSize.defaultSize! * 1.5,
                        color: Colors.white,
                        maxLines: 6,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const MedalsAbdFriends(),
                  ],
                ),
              ),
              SizedBox(
                width: AppSize.screenWidth! * .45,
                child: TabBar(
                    controller: tabController,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      IconWithMaterial(
                        imagePath: AssetPath.profile,
                        width: AppSize.defaultSize! * 3,
                        height: AppSize.defaultSize! * 3,
                      ),
                      IconWithMaterial(
                        imagePath: AssetPath.petProfile,
                        width: AppSize.defaultSize! * 3,
                        height: AppSize.defaultSize! * 3,
                      ),
                    ]),
              ),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Expanded(
                child: SizedBox(
                  height: AppSize.screenHeight! * .3,
                  child: TabBarView(controller: tabController, children: const [
                    PostsContainer(
                      addIcon: false,
                    ),
                    PostsContainer( addIcon: false,),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
