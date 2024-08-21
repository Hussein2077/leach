import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';
import 'package:leach/features/profile/presentation/controller/booking/bloc.dart';
import 'package:leach/features/profile/presentation/controller/booking/event.dart';
import 'package:leach/features/profile/presentation/controller/booking/state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/doctor_card2.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  void initState() {
    BlocProvider.of<BookingBloc>(context).add(GetAllBookingEvent());
    super.initState();
  }

  int first = 0;
  List<AllBookingModel>? allBookingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 82, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: AppSize.defaultSize! * 3,
                    left: AppSize.defaultSize! * 2),
                child: const LeadingIcon(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: AppSize.defaultSize! * 3),
                child: Row(
                  children: [
                    Image.asset(AssetPath.smallWhiteCalendar),
                    CustomText(
                      color: Colors.white,
                      text: StringManager.bookingHistory.tr(),
                      fontSize: AppSize.defaultSize! * 2,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              BlocConsumer<BookingBloc, BookingState>(
                listener: (context, state) {
                  if (state is CancelBookingErrorState) {
                    BlocProvider.of<BookingBloc>(context)
                        .add(GetAllBookingEvent());

                    LoadingOverlay().hide();
                    log('CancelBookingErrorState');

                    errorSnackBar(context, state.errorMessage);
                  } else if (state is CancelBookingSuccessState) {
                    BlocProvider.of<BookingBloc>(context)
                        .add(GetAllBookingEvent());
                    LoadingOverlay().hide();
                    log('CancelBookingSuccessState');
                    successSnackBar(context, 'Booking canceled successfully');
                  } else if (state is CancelBookingLoadingState) {
                    LoadingOverlay().show(context);
                    log('CancelBookingLoadingState');
                  }
                },
                builder: (context, state) {
                  if (state is GetAllBookingLoadingState) {
                    return (first == 0 && allBookingModel == null)
                        ? const LoadingWidget()
                        :     allBookingListView(allBookingModel);
                    ;
                  } else if (state is GetAllBookingSuccessState) {
                    first++;
                    allBookingModel = state.allBookingModel;
                    return  allBookingListView(allBookingModel);
                  } else if (state is GetAllBookingErrorState) {
                    return ErrorWidget(state.errorMessage);
                  } else {
                    if (allBookingModel != null) {
                      return allBookingListView(allBookingModel);
                    }
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
  Widget allBookingListView(List<AllBookingModel>? allBookingModel) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allBookingModel!.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => DoctorCard2(
        data: allBookingModel[index],
      ),
      shrinkWrap: true,
    );
  }
}
