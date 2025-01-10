import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/widgets/custom_tv_card.dart';
import 'package:netflix_clone/presentation/home/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:netflix_clone/presentation/home/bloc/popular_tv/popular_tv_event.dart';
import 'package:netflix_clone/presentation/home/bloc/popular_tv/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PopularTvBloc()..add(FetchPopularTv()),
        child: BlocBuilder<PopularTvBloc, PopularTvState>(
          builder: (context, state) {
            if (state is PopularTvLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is PopularTvLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return TVCard(
                      tvEntity: state.tv[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: state.tv.length,
                ),
              );
            }

            if (state is PopularTvFailure) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
