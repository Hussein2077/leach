import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/empty_widget.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/bloc.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/event.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/state.dart';
import 'package:leach/features/home/presentation/widgets/doctor_card.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key, required this.typeOfVendor});

  final TypeOfVendor typeOfVendor;

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  void initState() {
    Methods.instance.chooseVendorType(context, type: widget.typeOfVendor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(
                image: AssetPath.handIcon,
              ),
              CustomText(
                text: StringManager.availableSpecialists.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              CustomText(
                fontFamily: 'Gully',
                text: StringManager.selectPreferredVet.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              BlocBuilder<VendorsBloc, BaseVendorsState>(
                builder: (context, state) {
                  if (state is GetVendorsLoadingState) {
                    return const Center(
                        child: LoadingWidget(
                      color: AppColors.primaryColor,
                    ));
                  } else if (state is GetVendorsErrorState) {
                    return ErrorWidget(state.errorMessage);
                  } else if (state is GetVendorsSuccessState) {
                    return state.vendors.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.vendors.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => DoctorCard(
                              vendor: state.vendors[index],
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.calenderScreen ,
                                  arguments: state.vendors[index],
                                );
                              },
                            ),
                            shrinkWrap: true,
                          )
                        : const EmptyWidget(
                            text: 'No Vendors Available',
                          );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
