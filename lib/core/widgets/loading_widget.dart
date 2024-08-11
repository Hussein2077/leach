import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.height, this.width, this.size});

  final double? height;
  final double? width;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}

class LoadingOverlay {
  static final LoadingOverlay _instance = LoadingOverlay._internal();

  factory LoadingOverlay() {
    return _instance;
  }

  LoadingOverlay._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return; // Prevhu  ent multiple overlays

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5),
          // Semi-transparent background
          child: const Center(
            child: LoadingAnimation(),
          ),
        ),
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  LoadingAnimationState createState() => LoadingAnimationState();
}

class LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        AssetPath.loading,
        height: AppSize.defaultSize! * 7,
        width: AppSize.defaultSize! * 7,
      ), // Replace with your asset path
    );
  }
}
