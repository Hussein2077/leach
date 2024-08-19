
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
class PetDropDown extends StatefulWidget {
  const PetDropDown ({super.key, required this.pets, this.onTap, required this.currentPet});
final List<Pet> pets;
final  Pet currentPet ;
final void Function(int index)? onTap;
  @override
  State<PetDropDown> createState() => _PetDropDownState();
}

class _PetDropDownState extends State<PetDropDown> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Stack(
            children: [
              Positioned(
                top: AppSize.defaultSize! * 8,
                // Adjust this value as needed to position the dialog from the top
                left: AppSize.defaultSize! * 7,
                // Adjust for horizontal centering or alignment
                right: AppSize.defaultSize! * 7,
                // Adjust for horizontal centering or alignment
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: AppSize.defaultSize! * 18,
                    // Fixed height
                    width: AppSize.defaultSize! * 10,
                    // Fixed width
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          AppSize.defaultSize! * 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.pets.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(
                                    AppSize.defaultSize!),
                                child: InkWell(
                                  onTap: () {
                                    widget.onTap?.call(index);
                                  },
                                  child: Row(
                                    children: [
                                      CachedNetworkCustom(
                                        url: widget.pets[index]
                                            .profilePicture,
                                        width:
                                        AppSize.defaultSize! *
                                            3,
                                        height:
                                        AppSize.defaultSize! *
                                            3,
                                      ),
                                      SizedBox(
                                        width:
                                        AppSize.defaultSize,
                                      ),
                                      CustomText(
                                        text: widget
                                            .pets[index].name,
                                        fontWeight:
                                        FontWeight.w700,
                                      ),
                                      const Spacer(),
                                      if (widget.currentPet.uuid ==
                                          widget.pets[index].uuid)
                                        CircleAvatar(
                                          backgroundColor:
                                          AppColors
                                              .primaryColor,
                                          radius: AppSize
                                              .defaultSize! *
                                              .5,
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, Routes.addPetScreen);
                          },
                          icon: Row(
                            children: [
                              IconWithMaterial(
                                imagePath: AssetPath.add,
                                width: AppSize.defaultSize! * 2,
                                height: AppSize.defaultSize! * 2,
                              ),
                              SizedBox(
                                width: AppSize.defaultSize!,
                              ),
                              CustomText(
                                text: StringManager.addPet.tr(),
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      icon:  CachedNetworkCustom(
        url: (widget.currentPet!.profilePicture.isEmpty)
            ? widget.currentPet!.pictures[0].picture
            : widget.currentPet!.profilePicture,
        width: AppSize.defaultSize! * 3,
        height: AppSize.defaultSize! * 3,
      )
    );
  }
}
