import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/home/presentation/manager/how_to/bloc.dart';
import 'package:leach/features/home/presentation/manager/how_to/event.dart';
import 'package:leach/features/home/presentation/manager/how_to/state.dart';

class TrainYourDog extends StatefulWidget {
  const TrainYourDog({super.key, required this.trainParamRoute});

  final TrainParamRoute trainParamRoute;

  @override
  State<TrainYourDog> createState() => _TrainYourDogState();
}

class _TrainYourDogState extends State<TrainYourDog> {
  @override
  void initState() {
    BlocProvider.of<HowToBloc>(context).add(GetHowToEvent(
      petType: widget.trainParamRoute.petType,
      category: widget.trainParamRoute.category,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 2,
          right: AppSize.defaultSize! * 2,
          top: AppSize.defaultSize! * 6,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(
                image: AssetPath.handIcon,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetPath.dogSmall,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: AppSize.defaultSize! * 2,
                  ),
                  CustomText(
                    text: StringManager.trainYourDog.tr(),
                    fontSize: AppSize.defaultSize! * 4,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              BlocBuilder<HowToBloc, BaseHowToState>(
                builder: (context, state) {
                  if (state is GetHowToLoadingState) {
                    return LoadingWidget(
                      color: AppColors.primaryColor,
                      padding: AppSize.screenHeight! * .2,
                    );
                  } else if (state is GetHowToSuccessState) {
                    return Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.howTo.length,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.defaultSize!),
                            child: MainButton(
                              text: state.howTo[index].title,
                              onTap: () {
                                Navigator.pushNamed(context, Routes.howTo,
                                    arguments: state.howTo[index]);
                              },
                              color: const Color.fromRGBO(246, 255, 255, 1),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetHowToErrorState) {
                    return ErrorWidget(state.errorMessage);
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrainParamRoute {
  String petType;
  String category;

  TrainParamRoute({required this.petType, required this.category});
}
