import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_event.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';
import 'package:netflix_clone/domain/tv/enitities/keyword.dart';
import 'package:netflix_clone/domain/tv/usecases/get_keywords_usecase.dart';
import 'package:netflix_clone/service_locator.dart';

class TVKeywords extends StatelessWidget {
  final int tvId;
  const TVKeywords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataBloc()
        ..add(
          FetchData<List<KeywordEntity>>(
              usecase: sl<GetTVKeywordsUseCase>(), params: tvId),
        ),
      child: BlocBuilder<GenericDataBloc, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children: keywords
                  .map((item) => Chip(
                        label: Text(item.name!),
                      ))
                  .toList(),
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
