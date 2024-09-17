import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'Features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'Features/home/presentation/newest_books_cubit/newest_books_cubit.dart';
import 'core/utils/app_router.dart';
import 'core/utils/functions/setup_service_locator.dart';
import 'core/utils/functions/simple_block_observe.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlockObserve();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  FetchFeaturedBooksUseCase(
                    getIt.get<HomeRepoImpl>(),
                  ),
                )),
        BlocProvider(
            create: (context) => NewestBooksCubit(
                  FetchNewestBooksUseCase(
                    getIt.get<HomeRepoImpl>(),
                  ),
                )),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
