import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/main_screen_bloc.dart';
class PetOrProfile extends StatelessWidget {
  const PetOrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        final selectedIndex =
        state is TabChangedState ? state.selectedIndex : 4;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context
                    .read<MainScreenBloc>()
                    .add(const ChangeTabEvent(3));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconWithMaterial(
                    imagePath: AssetPath.profile,
                    width: AppSize.defaultSize! * 3,
                    height: AppSize.defaultSize! * 3,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! *
                        .5, // Add some space for the divider
                  ),
                  if(selectedIndex==3)
                    Container(
                      width: AppSize.defaultSize! * 6,
                      height: 2,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
            SizedBox(
              width: AppSize.defaultSize! * 4,
            ),
            InkWell(
              onTap: () {
                context
                    .read<MainScreenBloc>()
                    .add(const ChangeTabEvent(2));
              },
              child: Column(
                children: [
                  IconWithMaterial(
                    imagePath: AssetPath.petProfile,
                    width: AppSize.defaultSize! * 3,
                    height: AppSize.defaultSize! * 3,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! *
                        .5, // Add some space for the divider
                  ),
                  if(selectedIndex==2)
                    Container(
                      width: AppSize.defaultSize! * 6,
                      height: 2,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
