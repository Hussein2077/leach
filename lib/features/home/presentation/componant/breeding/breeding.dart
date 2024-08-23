import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/presentation/componant/breeding/breeding_card.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_bloc.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_event.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_state.dart';

class BreedingScreen extends StatefulWidget {
  final String type;

  const BreedingScreen({super.key, required this.type});

  @override
  State<BreedingScreen> createState() => _BreedingScreenState();
}

class _BreedingScreenState extends State<BreedingScreen> {

  int page = 1;
  int totalPages = 0;
  final scrollcontroller = ScrollController();

  List<BreedingData> data = [];

  @override
  void initState() {
    scrollcontroller.addListener(_scrollListener);
    BlocProvider.of<BreedingBloc>(context).add(
        GetBreedingEvent(page: '1', type: widget.type));
    super.initState();
  }

  void _scrollListener() {
    if (scrollcontroller.position.pixels == scrollcontroller.position.maxScrollExtent) {
      if (page < totalPages) {
        page = page + 1;
        BlocProvider.of<BreedingBloc>(context).add(
            GetMoreBreedingEvent(page: page.toString(), type: widget.type));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadingIcon(),
            Expanded(
              child: BlocBuilder<BreedingBloc, BreedingState>(
                builder: (context, state) {
                  if (state is GetBreedingSuccessState) {
                    totalPages = state.breedingModel.breeding?.pagination?.total ?? 1;
                    page = 1;
                    data = [];
                    for (final e in state.breedingModel.breeding!.data!) {
                      data.add(e);
                    }
                    return ListView.builder(
                      controller: scrollcontroller,
                      cacheExtent: 1000,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return BreedingCard(data: data[index],);
                      },
                    );
                  }else if (state is GetMoreBreedingLoadingState) {
                    return ListView.builder(
                      controller: scrollcontroller,
                      cacheExtent: 1000,
                      itemBuilder: (context, index) => BreedingCard(
                        data: data[index],
                      ),
                      itemCount: data.length,
                    );
                  } else if (state is GetMoreBreedingSuccessState) {
                    for (final e in state.breedingModel.breeding!.data!) {
                      data.add(e);
                    }
                    return ListView.builder(
                      controller: scrollcontroller,
                      cacheExtent: 1000,
                      itemBuilder: (context, index) => BreedingCard(
                        data: data[index],
                      ),
                      itemCount: data.length,
                    );
                  } else {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
