import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';

class FriendPostPet extends StatefulWidget {
  final List<String> images;
  final List<String>? body;
  const FriendPostPet({super.key, required this.images, this.body});

  @override
  State<FriendPostPet> createState() => _FriendPostPetState();
}

class _FriendPostPetState extends State<FriendPostPet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: const Color.fromRGBO(246, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.defaultSize! * 4),
                      topRight: Radius.circular(AppSize.defaultSize! * 4),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
                    child: widget.images.isNotEmpty? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(widget.body!.isNotEmpty) Padding(
                                padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
                                child: CustomText(
                                  text: widget.body?[index]??"",
                                  fontSize: AppSize.defaultSize! * 2,
                                  color: AppColors.primaryColor,
                                ),
                              ),

                              CachedNetworkCustom(
                                url: widget.images[index],
                                width: AppSize.screenWidth!,
                                height: AppSize.defaultSize! * 20,
                                shape: BoxShape.rectangle,
                              ),
                            ],
                          ),
                        );
                      },
                    ): Center(
                  child: Text("No Posts", style: TextStyle(fontSize: AppSize.defaultSize! * 3,),),
              ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
