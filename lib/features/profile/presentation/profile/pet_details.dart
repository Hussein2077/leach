import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/widgets/background.dart';
import 'widgets/posts_container.dart';




class PetDetails extends StatelessWidget {
  const PetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        image: AssetPath.homeBackground,
        child: Column(
          children: [
            Container(


            ),
            const PostsContainer(
              commonType: CommonType(pictures: []),
            ),
          ],
        )
    );
  }
}
