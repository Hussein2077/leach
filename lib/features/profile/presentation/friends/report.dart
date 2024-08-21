import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context,Routes.friends);
        },
        child: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: Center(

               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,

                 children: [

                   CustomText(
                     text: StringManager.reportSubmitted.tr(),
                     fontSize: AppSize.defaultSize! * 4,
                     maxLines: 5,
                     fontFamily: 'Brodie',
                     color: Colors.white,


                   ),
                   Image(image: AssetImage(AssetPath.tick),),
                 ],

               ),




          ),
        ),
      ),
    );
  }
}

