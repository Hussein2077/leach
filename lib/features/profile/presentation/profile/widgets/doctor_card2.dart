import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/available_training_specialist_row.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';
import 'package:leach/features/profile/presentation/controller/booking/bloc.dart';
import 'package:leach/features/profile/presentation/controller/booking/event.dart';
import 'package:leach/features/profile/presentation/controller/booking/state.dart';

class DoctorCard2 extends StatefulWidget {
  const DoctorCard2({super.key, this.onTap, required this.data});

  final Function()? onTap;
  final AllBookingModel data;

  @override
  State<DoctorCard2> createState() => _DoctorCard2State();
}

class _DoctorCard2State extends State<DoctorCard2> {
  @override
  void dispose() {
    LoadingOverlay().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize!),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
        ),
        elevation: 10,
        color: const Color.fromRGBO(246, 255, 255, 1),
        shadowColor: Colors.black,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * .6),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppSize.defaultSize! * 6,
                      left: AppSize.defaultSize! * 1.5),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: AppSize.defaultSize! * 3.5,
                        backgroundColor: Colors.transparent,
                        child: CachedNetworkCustom(
                          url: widget.data.vendor.image,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.defaultSize! * 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: widget.data.vendor.name,
                            fontSize: AppSize.defaultSize! * 3,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                          CustomText(
                            text:
                                '    (${widget.data.bookingStatus.toLowerCase()})',
                            fontSize: AppSize.defaultSize! * 1.5,
                            color: Colors.orange,
                            fontFamily: 'Gully',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text: widget.data.vendor.description,
                      image: AssetPath.doctor2,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text:
                          '${StringManager.address}: ${widget.data.vendor.address}',
                      image: AssetPath.address,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text:
                          '${StringManager.fees}: ${widget.data.vendor.baseFee}',
                      image: AssetPath.fees,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text: '${StringManager.date}: ${widget.data.date}',
                      image: AssetPath.smallCalendar,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text: '${StringManager.time}:${widget.data.time}',
                      image: AssetPath.clock,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 3),
                    TextImageRow(
                      text:
                          '${StringManager.phone}:${widget.data.vendor.phoneNumber}',
                      image: AssetPath.phone,
                    ),
                    SizedBox(height: AppSize.defaultSize! * 7),
                    Center(
                      child: MainButton(
                        text: StringManager.cancel.tr(),
                        fontSize: AppSize.defaultSize! * 2.5,
                        onTap: () {
                          //show alert dialog

                          Methods.instance.showAlertDialog(context,
                              title: 'Are you sure to cancel this booking ? ',
                              onPressed: () {
                            BlocProvider.of<BookingBloc>(context).add(
                                CancelBookingEvent(bookingId: widget.data.id));
                          });
                        },
                        color: Colors.white,
                        textColor: Colors.red.withOpacity(.9),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
