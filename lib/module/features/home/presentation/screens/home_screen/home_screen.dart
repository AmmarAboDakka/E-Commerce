import 'package:e_commerce/module/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/module/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.state) {
          
          case RequestState.loading:
            return const  Center(child: CircularProgressIndicator.adaptive(),);
           
          case RequestState.loaded:
          return   Container(
              child: Text(state.data!.status.toString()));          case RequestState.error:
            return Container(
              child: Text("state.data as String"),
            );
        }
        
      },
    );
  }
}

