import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:flutter_firebase_login/theme.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:flutter_firebase_login/posts/posts.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required PostsRepository postsRepository,
  })  : _authenticationRepository = authenticationRepository,
        _postsRepository = postsRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final PostsRepository _postsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authenticationRepository,
          child: BlocProvider(
              create: (_) => AppBloc(
                    authenticationRepository: _authenticationRepository,
                  )),
        ),
        RepositoryProvider.value(
          value: _postsRepository,
          child: BlocProvider(
              create: (_) => PostBloc(
                    postsRepository: _postsRepository,
                  )),
        ),
      ],
      child: const AppView(),
    );
  }
}

//     return RepositoryProvider.value(
//       value: _authenticationRepository,
//       child: BlocProvider(
//         create: (_) => AppBloc(
//           authenticationRepository: _authenticationRepository,
//         ),
//         child: const AppView(),
//       ),
//     );
//   }
// }

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
