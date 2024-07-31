import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/profile/presentation/profile/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
class PetProfile extends StatelessWidget {
  const PetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.defaultSize! * 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
          child: Column(
            children: [
              const ProfileAppBar(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
                ProfileUserRow(
                  name:'Kiwi ' ,
                  userName: '@Kiwithedog',
                  kind: 'German Shepherd  ',
                  image: AssetPath.testPosts4,
                ),
              SizedBox(
                height: AppSize.defaultSize! ,
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
              const MedalsAbdFriends(pet: true,),
            ],
          ),
        ),
        const PetOrProfile(),

        SizedBox(
              height: AppSize.defaultSize,
        ),
        const PostsContainer()
      ],
    );
  }
}
