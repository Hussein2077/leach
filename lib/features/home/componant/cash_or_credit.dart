import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leach/core/widgets/available_training_specialist_row.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
class CashOrCredit extends StatelessWidget {
  const CashOrCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: Column(
          children: [

            const LeadingWithIcon(
              image: AssetPath.debit,
            ),
            CustomText(
              text: StringManager.choosePaymentOption.tr(),
              fontSize: AppSize.defaultSize! * 4,
              fontWeight: FontWeight.w700,
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!*1.5 ),
                  color: Colors.white,
                  child: SizedBox(
                    height: AppSize.defaultSize! * 17,
                    width: AppSize.defaultSize! * 15,
                    child: Center(
                      child: CustomText(text: StringManager.debitCreditCard.tr(),
                        fontSize: AppSize.defaultSize! * 3,
                        fontWeight: FontWeight.w700,
                        maxLines: 2,

                        textAlign: TextAlign.center
                        ,
                      ),
                    ),
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!  *1.5 ),
                  color: Colors.white,
                  child: SizedBox(
                    height: AppSize.defaultSize! * 17,
                    width: AppSize.defaultSize! * 15,
                    child: Center(
                      child: CustomText(text: StringManager.cash.tr(),
                        fontSize: AppSize.defaultSize! * 3,
                        fontWeight: FontWeight.w700,
                        maxLines: 2,

                        textAlign: TextAlign.center
                        ,
                      ),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}
