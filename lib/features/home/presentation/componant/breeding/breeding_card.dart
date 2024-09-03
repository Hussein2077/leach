import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/presentation/componant/age_size_row.dart';

class BreedingCard extends StatefulWidget {
  final BreedingData data;
  const BreedingCard({super.key, required this.data});

  @override
  State<BreedingCard> createState() => _BreedingCardState();
}

class _BreedingCardState extends State<BreedingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(AppSize.defaultSize! * 2),
          ),
          width: AppSize.defaultSize! * 35,
          height: AppSize.defaultSize! * 51,
          child: Stack(
            children: [
              CachedNetworkCustom(
                url: widget.data.profilePicture??"",
                width: AppSize.screenWidth!,
                height: AppSize.defaultSize! * 55,
                shape: BoxShape.rectangle,
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: AppSize.defaultSize! * 2,
                  right: AppSize.defaultSize! * 1.5,
                ),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconWithMaterial(
                      imagePath: AssetPath.chat,
                      width: AppSize.defaultSize! *2.5,
                      height: AppSize.defaultSize! * 2.5,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSize.defaultSize! * 2.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.defaultSize! * 1.5),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: widget.data.name??'',
                    fontSize: AppSize.defaultSize! * 4,
                    fontWeight: FontWeight.w700,
                  ),
                  const Spacer(),
                  IconWithMaterial(
                    imagePath: AssetPath.like,
                    width: AppSize.defaultSize! * 2.5,
                    height: AppSize.defaultSize! * 2.5,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.defaultSize! * 0.5,
              ),
              Row(
                children: [
                  Image.asset(
                    AssetPath.dogFace,
                    width: AppSize.defaultSize! * 2,
                    height: AppSize.defaultSize! * 2,
                  ),
                  SizedBox(
                    width: AppSize.defaultSize! * .5,
                  ),
                  CustomText(
                    text: widget.data.breed??'',
                    fontSize: AppSize.defaultSize! * 2,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.defaultSize! * 1.5,
              ),
              AgeSizeRow(
                age: widget.data.age!.toString(),
                weight: widget.data.weight!.toString(),
                gender: widget.data.gender!.toString(),
                size: widget.data.size!.toString(),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
