import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class EditPost extends StatefulWidget {
  final PostData data;

  const EditPost({super.key, required this.data});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController postController = TextEditingController();

  @override
  void initState() {
    postController.text = widget.data.caption ?? "";
    super.initState();
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPostsBloc, UserPostState>(
      listener: (context, state) {
        if (state is EditeUserPostsSuccessState) {
          LoadingOverlay().hide();
          Navigator.pop(context);
        } else if (state is EditeUserPostsLoadingState) {
          LoadingOverlay().show(context);
        } else if (state is EditeUserPostsErrorState) {
          LoadingOverlay().hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
      child: Scaffold(
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: Column(
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Padding(
                  padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 2,
          right: AppSize.defaultSize! * 2,
          top: AppSize.defaultSize! * 6,
        ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LeadingIcon(
                      color: Colors.white,
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
                    color: Color.fromRGBO(246, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.defaultSize! * 4),
                      topRight: Radius.circular(AppSize.defaultSize! * 4),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.defaultSize! * 3),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: AppSize.defaultSize! * 3),
                          SideBarRow(
                            textSize: AppSize.defaultSize! * 2.8,
                            image: AssetPath.edit,
                            text: StringManager.editPost.tr(),
                            onTap: () {},
                          ),
                          Divider(
                            color: Colors.black,
                            height: 5,
                            thickness: 0.6,
                            indent: AppSize.defaultSize! * 2.2,
                            endIndent: AppSize.defaultSize! * 2.8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: AppSize.defaultSize! * 3,
                              ),
                            ],
                          ),
                          Container(
                            width: AppSize.screenWidth!,
                            height: AppSize.defaultSize! * 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
                              image: DecorationImage(
                                image: NetworkImage(widget.data.picture ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.defaultSize! * 2,
                          ),
                          CustomTextField(
                            hintText: StringManager.writeCaption.tr(),
                            controller: postController,
                            suffixIcon: Image.asset(
                              AssetPath.chat,
                              color: AppColors.primaryColor,
                              scale: AppSize.defaultSize! * 0.15,
                            ),
                          ),
                          SizedBox(height: AppSize.defaultSize! * 9),
                          MainButton(
                            text: StringManager.save.tr(),
                            onTap: () async {
                              FormData? formData;
                              formData = FormData.fromMap({
                                "caption": postController.text,
                              });
                              BlocProvider.of<UserPostsBloc>(context).add(
                                  EditeUserPostEvent(
                                      data: formData, id: widget.data.uuid!));
                            },
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: AppSize.defaultSize! * 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
