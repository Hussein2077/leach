import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_bloc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_event.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_bloc.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_event.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_state.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_state.dart';
import 'package:leach/features/profile/presentation/friends/friend_view_body.dart';

class FriendsView extends StatefulWidget {
  final String uuid;

  const FriendsView({super.key, required this.uuid});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  UserDataModel? userDataModel;

  @override
  void initState() {
    BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetFriendRequestBloc, GetFriendRequestState>(
      listener: (context, state) {
        if (state is RemoveFriendSuccessState) {
          successSnackBar(context, state.message);
          BlocProvider.of<GetFriendsBloc>(context).add(const GetFriendsEvent(page: "1"));
          BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
        }else if(state is RemoveFriendErrorState){
          errorSnackBar(context, state.errorMessage);
        }else if(state is SendFriendRequestsSuccessState){
          successSnackBar(context, state.message);
          BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
        }else if(state is SendFriendRequestsErrorState){
          errorSnackBar(context, state.errorMessage);
        }else if(state is AcceptFriendRequestsSuccessState){
          successSnackBar(context, state.message);
          BlocProvider.of<GetFriendsBloc>(context).add(const GetFriendsEvent(page: "1"));
          BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
        }else if(state is RejectFriendRequestsSuccessState){
          successSnackBar(context, state.message);
          BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
        }else if(state is BlockUserSuccessState){
          successSnackBar(context, state.message);
          BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: BackgroundScreen(
            image: AssetPath.homeBackground,
            child: BlocBuilder<GetUserBloc, GetUserState>(
              builder: (context, state) {
                if (state is GetUserSuccessState) {
                  userDataModel = state.userDataModel;
                  return FriendViewBody(uuid: widget.uuid, userDataModel: userDataModel!);
                } else if (state is GetUserLoadingState) {
                  if(userDataModel != null){
                    return FriendViewBody(uuid: widget.uuid, userDataModel: userDataModel!);
                  }else {
                    return const LoadingWidget();
                  }
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
