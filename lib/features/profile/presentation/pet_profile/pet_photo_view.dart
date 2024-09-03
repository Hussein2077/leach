import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/plain_card.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';

class PetPhotoView extends StatefulWidget {
  const PetPhotoView({super.key, required this.commonType});

  final CommonType commonType;

  @override
  State<PetPhotoView> createState() => _PetPhotoViewState();
}

class _PetPhotoViewState extends State<PetPhotoView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePetBloc, CreatePetState >(
      listener: (context, state) {
        if (state is AddPhotoForPetLoadingState) {
          LoadingOverlay().show(context);
        }
        if (state is AddPhotoForPetSuccessMessageState) {
          LoadingOverlay().hide();
          BlocProvider.of<GetMyDataBloc>(context).add(GetMyDataEvent());

          Navigator.pushNamedAndRemoveUntil(context, Routes.main, arguments: 2, (route) => false);
        }
        if (state is AddPhotoForPetErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 2,
          right: AppSize.defaultSize! * 2,
          top: AppSize.defaultSize! * 6,
        ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSize.defaultSize! * 5.5,
                          left: AppSize.defaultSize! * 2.5,
                        ),
                        child: const LeadingIcon(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                Expanded(
                  child: Container(
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.defaultSize! * 4),
                        topRight: Radius.circular(AppSize.defaultSize! * 4),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.defaultSize! * 3),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: widget.commonType.pictures.length,
                        itemBuilder: (context, index) {
                          return PlainCard(
                            uuid: widget.commonType.ids![index],
                            path: widget.commonType.pictures[index],
                            onDeleteTap: () {
                              BlocProvider.of<CreatePetBloc>(context)
                                  .add(AddPhotoForPetEvent(
                                petId: widget.commonType.ids![index],));

                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
