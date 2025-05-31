import 'package:contact_app/core/constant/app_colors.dart';
import 'package:contact_app/data/repositories/contact_repository.dart';
import 'package:contact_app/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_app/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final repository = ContactRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(repository)..add(LoadContacts()),
      child: MaterialApp(
        title: 'Contact App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentOrange),
        ),
        home: HomeView(repository: repository),
      ),
    );
  }
}
