import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leach/core/widgets/available_training_specialist_row.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/bloc.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/event.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/state.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    super.key,
    required this.reviewParams,
  });

  final ReviewParams reviewParams;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VendorsBloc,  BaseVendorsState>(
  listener: (context, state) {
      if(state is RequestBookingLoadingState)
        {
          LoadingOverlay().show(context);
        }
      else if(state is RequestBookingErrorState)
        {
          LoadingOverlay().hide();
          errorSnackBar(context,  state.errorMessage);
        }
      else if(state is RequestBookingSuccessState)
        {
          LoadingOverlay().hide();
          successSnackBar(context, 'Request Sent Successfully');
          Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false);
        }
  },
  child: Scaffold(
      body: BackgroundScreen(
        image: AssetPath.homeBackground2,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppSize.defaultSize! * 5,
                      left: AppSize.defaultSize! * 3.6,
                      right: AppSize.defaultSize! * 3.6),
                  child: Row(
                    children: [
                      const LeadingIcon(
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Image.asset(
                        AssetPath.calender,
                        color: Colors.white,
                        width: AppSize.defaultSize! * 3,
                        height: AppSize.defaultSize! * 3,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppSize.screenHeight! * .65,
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.defaultSize! * 4),
                            topRight:
                                Radius.circular(AppSize.defaultSize! * 4))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.defaultSize! * 3),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetPath.addPet,
                              color: AppColors.primaryColor,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: AppSize.defaultSize! * 3.5,
                                  backgroundColor: Colors.transparent,
                                  child: CachedNetworkCustom(
                                    url: reviewParams.vendor.image,
                                  ),
                                ),
                                CustomText(
                                  text: reviewParams.vendor.name,
                                  fontSize: AppSize.defaultSize! * 3,
                                  fontWeight: FontWeight.w700,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppSize.defaultSize!,
                                ),
                                // const TextImageRow(
                                //   text: 'Microchip',
                                //   image: AssetPath.doctor2,
                                // ),
                                // SizedBox(height: AppSize.defaultSize! * 3),
                                TextImageRow(
                                  text:
                                      '${StringManager.address} : ${reviewParams.vendor.address}',
                                  image: AssetPath.address,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                  TextImageRow(
                                  text: '${StringManager.fees}: ${reviewParams.vendor.baseFee}',
                                  image: AssetPath.fees,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                  TextImageRow(
                                  text: '${StringManager.date} ${reviewParams.date}',
                                  image: AssetPath.calender,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                  TextImageRow(
                                  text: '${StringManager.time} ${reviewParams.time}',
                                  image: AssetPath.clock,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                  TextImageRow(
                                  text: '${StringManager.phone}:  ${reviewParams.vendor.phoneNumber}',
                                  image: AssetPath.phone,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                Center(
                                  child: MainButton(
                                    text: StringManager.confirmAppointment.tr(),
                                    onTap: () {
                                      //RequestBookingEvent
                                      BlocProvider.of<VendorsBloc>(context) .add(RequestBookingEvent(requestBooking: RequestBookingParam(
                                        date: reviewParams.date.substring(  0, 10),
                                        time: reviewParams.time,
                                        vendorId: reviewParams.vendor.id,
                                      )));
                                      
                                    },
                                    textColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
);
  }
}

class ReviewParams {
  final String date;
  final String time;
  final Vendor vendor;

  ReviewParams({required this.date, required this.time, required this.vendor});
}
