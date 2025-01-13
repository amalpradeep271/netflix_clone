import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/widgets/custom_appbar.dart';

import 'package:netflix_clone/presentation/search/bloc/search_cubit.dart';
import 'package:netflix_clone/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix_clone/presentation/search/widgets/search_content.dart';
import 'package:netflix_clone/presentation/search/widgets/search_field.dart';
import 'package:netflix_clone/presentation/search/widgets/search_options.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectableOptionCubit(),
          ),
          BlocProvider(create: (context) => SearchCubit())
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchField(),
              SizedBox(
                height: 16,
              ),
              SearchOptions(),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SearchContent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
