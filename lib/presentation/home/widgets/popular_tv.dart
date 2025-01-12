import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';
import 'package:netflix_clone/common/widgets/custom_tv_card.dart';
import 'package:netflix_clone/domain/tv/enitities/tv.dart';
import 'package:netflix_clone/domain/tv/usecases/get_popular_tv_usecase.dart';

import 'package:netflix_clone/service_locator.dart';

import '../../../common/bloc/generic_data/generic_data_event.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataBloc()
          ..add(
            FetchData<List<TvEntity>>(
              usecase: sl<GetPopularTvUsecase>(),
            ),
          ),
        child: BlocBuilder<GenericDataBloc, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is DataLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return TVCard(
                      tvEntity: state.data[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: state.data.length,
                ),
              );
            }

            if (state is FailureLoadData) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
