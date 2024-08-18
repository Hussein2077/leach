import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/dottet_border_custom.dart';
import 'package:http_parser/http_parser.dart';

class AddPost extends StatefulWidget {
  AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> _getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void dispose() {
    image = null;
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPostsBloc, UserPostState>(
      listener: (context, state) {
        if(state is CreatePostsSuccessState){
          LoadingOverlay().hide();
          BlocProvider.of<PostsBloc>(context).add(const GetPostsEvent(page: "1"));
          BlocProvider.of<UserPostsBloc>(context).add(const GetUserPostsEvent(page: "1"));
          Navigator.pop(context);
        }else if(state is CreatePostsErrorState){
          LoadingOverlay().hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        }else if(state is CreatePostsLoadingState){
          LoadingOverlay().show(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: Methods.instance.paddingCustom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LeadingIcon(),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                image == null
                    ? DottedBorderCustom(
                        onTap: () {
                          _getImage();
                        },
                      )
                    : Container(
                        height: AppSize.defaultSize! * 36,
                        width: AppSize.defaultSize! * 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(image!.path)),
                              fit: BoxFit.cover),
                        ),
                      ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomText(
                    text: StringManager.optional.tr(),
                    color: AppColors.greyColor,
                    fontFamily: 'Gully',
                    fontSize: AppSize.defaultSize! * 1,
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1,
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
                SizedBox(
                  height: AppSize.defaultSize! * 10,
                ),
                MainButton(
                  text: StringManager.post.tr(),
                  onTap: () async {
                    FormData? formData;
                    if (image != null) {
                      formData = FormData.fromMap({
                        "caption": postController.text,
                        "picture": await MultipartFile.fromFile(image!.path,
                            filename: image?.path.split('/').last.toString(),
                            contentType: MediaType("image", "jpeg")),
                      });
                    } else {
                      formData = FormData.fromMap({
                        "caption": postController.text,
                      });
                    }
                    BlocProvider.of<UserPostsBloc>(context)
                        .add(CreatePostEvent(data: formData));
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
