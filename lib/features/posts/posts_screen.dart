import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/features/posts/widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<String>images = [
    AssetPath.testPosts,
    AssetPath.testPosts2,
    AssetPath.testPosts,
    AssetPath.testPosts2,
    AssetPath.testPosts,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) =>   PostCard(imagePath: images[index],),
        itemCount: images.length,
      ),
    );
  }
}
