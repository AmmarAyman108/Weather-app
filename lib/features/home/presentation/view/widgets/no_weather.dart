import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/style.dart';
import 'package:weather_app/features/search/presentation/Views/search_view.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: const Center(
        child: Text(
          'Search for a location',
          style: Style.textStyle20,
        ),
      ),
    );
  }

  void _navigateToSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SearchView()),
    );
  }
}
