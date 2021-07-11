import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:posts_repository/posts_repository.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  final postsRepository = FirestorePostsRepository();
  await authenticationRepository.user.first;
  runApp(App(authenticationRepository: authenticationRepository,
            postsRepository: postsRepository));
}
