import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/common/widgets/custom_appbar.dart';
import 'package:netflix_clone/core/configs/assets/app_vectors.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/presentation/home/widgets/trending.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TrendingMovies(),
        ],
      )),
    );
  }
}
