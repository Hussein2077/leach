import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';

class AccountPrivacy extends StatefulWidget {
  const AccountPrivacy({super.key});

  @override
  State<AccountPrivacy> createState() => _AccountPrivacyState();
}

class _AccountPrivacyState extends State<AccountPrivacy> {
  bool isSwitched = UserModel.getInstance().privateAccount??false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetMyDataBloc, GetMyDataState>(
      listener: (context, state) {
        if(state is ChangePrivacyLoadingState){
          LoadingOverlay().show(context);
        }
        else if (state is ChangePrivacySuccessState) {
          BlocProvider.of<GetMyDataBloc>(context).add(
              GetMyDataEvent());
          LoadingOverlay().hide();

          setState(() {
            isSwitched = !isSwitched;
          });
        }
        else if (state is ChangePrivacyErrorState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 2,
                right: AppSize.defaultSize! * 2,
                top: AppSize.defaultSize! * 6,
              ),
              child: const LeadingIcon(),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.defaultSize! * 2.2,
                  ),
                  child: Image.asset(
                    AssetPath.profilePrivacy,
                  ),
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 1.2,
                ),
                CustomText(
                  text: StringManager.accountPrivacy.tr(),
                  fontSize: AppSize.defaultSize! * 2,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.4,
            ),
            Divider(
              color: Colors.black,
              //color of divider
              height: 5,
              //height spacing of divider
              thickness: 0.6,
              //thickness of divier line
              indent: AppSize.defaultSize! * 2.2,
              //spacing at the start of divider
              endIndent:
              AppSize.defaultSize! * 2.8, //spacing at the end of divider
            ),
            Row(children: [
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppSize.defaultSize! * 30))),
                elevation: 0,
                color: Colors.transparent,
                // shadowColor: Colors.transparent,
                child: Transform.scale(
                  scale: AppSize.defaultSize! * 0.08,
                  child: Switch(
                    // thumb color (round icon)

                    activeColor: Colors.blue,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.blue,
                    inactiveTrackColor: Colors.white,

                    // boolean variable value
                    value: isSwitched,
                    // changes the state of the switch
                    onChanged: (value) {
                      BlocProvider.of<GetMyDataBloc>(context).add(
                          ChangePrivacyEvent());
                      // setState(() {
                      //   isSwitched = value;
                      // });
                    },
                  ),
                ),
              ),
              CustomText(
                text: '''Switch to a Private Account''',
                fontSize: AppSize.defaultSize! * 1.5,
                maxLines: 6,
                textAlign: TextAlign.start,
              ),
            ]),
          ],
        ),
      ),
    );
    return const Placeholder();
  }
}
