import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/style.dart';
import 'package:weather_app/core/utils/widget/gradient_background.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/search/presentation/Views/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SearchViewDetails extends StatefulWidget {
  const SearchViewDetails({super.key});

  @override
  State<SearchViewDetails> createState() => _SearchViewDetailsState();
}

class _SearchViewDetailsState extends State<SearchViewDetails> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController controller = TextEditingController();
  static AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Search a city',
            style: Style.textStyle28,
          ),
          leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 26,
                color: Colors.white,
              )),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: CustomTextField(
                  controller: controller,
                  onSubmitted: (value) {
                    triggerCubit(context);
                  },
                  onPressedSuffixIcon: () {
                    triggerCubit(context);
                  },
                )),
          ),
        ),
      ),
    );
  }

  void triggerCubit(BuildContext context) {
    if (validated()) {
      BlocProvider.of<GetWeatherCubit>(context)
          .getWeatherCubit(city: controller.text);
      Navigator.pop(context);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  bool validated() => formKey.currentState!.validate() ? true : false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
