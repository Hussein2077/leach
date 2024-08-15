import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyDataBloc, GetMyDataState>(
      builder: (context, state) {
        if(state is GetMyDataSuccessState) {
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
                    name: state.userModel.name??"",
                    userName: state.userModel.username??"",
                    image: state.userModel.image??"",
                  ),
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
                      text: state.userModel.bio ?? "",
                      fontSize: AppSize.defaultSize! * 1.5,
                      color: Colors.white,
                      maxLines: 6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  MedalsAbdFriends(
                    number_of_friends: state.userModel.friends?.length.toString()??"",
                  ),
                ],
              ),
            ),
            const PetOrProfile(),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            const Expanded(child: PostsContainer())
          ],
        );
        }else if(state is GetMyDataLoadingState){
          return const LoadingWidget();
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
