import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_event.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';
import 'package:netflix_clone/common/widgets/custom_tv_card.dart';
import 'package:netflix_clone/domain/tv/enitities/tv.dart';
import 'package:netflix_clone/domain/tv/usecases/get_recommended_tv_usecase.dart';
import 'package:netflix_clone/service_locator.dart';

class RecommendationTVs extends StatelessWidget {
  final int tvId;
  const RecommendationTVs({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataBloc()
          ..add(
            FetchData<List<TvEntity>>(
                usecase: sl<GetRecommendationTvsUseCase>(), params: tvId),
          ),
        child: BlocBuilder<GenericDataBloc, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is DataLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommendation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TVCard(
                            tvEntity: state.data[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: state.data.length),
                  ),
                ],
              );
            }

            if (state is FailureLoadData) {
              return Text(state.errorMessage);
            }

            return Container();
          },
        ));
  }
}
