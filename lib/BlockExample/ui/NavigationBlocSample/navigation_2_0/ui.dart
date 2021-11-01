import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_bloc.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_event.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_state.dart';



class Navigation20NavigationHome extends StatelessWidget {
  const Navigation20NavigationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => BookBloc(),
      child: BooksApp(),
    );
  }
}

class BooksApp extends StatelessWidget {
  const BooksApp({Key? key}) : super(key: key);

  List<Page> onGeneratePages(BookState state, List<Page> pages) {
    final selectedBook = state.selectedBook;
    return [
      BooksListPage.page(books: state.books),
      if (selectedBook != null)
        BookDetailsPage.page(book: selectedBook)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books App',
      home: FlowBuilder(
        state: context.watch<BookBloc>().state,
        onGeneratePages: onGeneratePages,
      ),
    );
  }
}

class BooksListPage extends StatelessWidget {
  const BooksListPage({Key? key, required this.books}) : super(key: key);

  static Page page({required List<Book> books}) {
    return MaterialPage<void>(
      child: BooksListPage(books: books),
    );
  }

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0XFFe5fbff),
          title: Text(
              'Books',
              style: TextStyle(
                  color: Color(0xff113a83),
                  fontSize: 18
              )
          )),
      body: ListView(
        children: [
          for (final book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                context.read<BookBloc>().add(BookSelected(book: book));
              },
            )
        ],
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key? key, required this.book});

  static Page page({required Book book}) {
    return MaterialPage<void>(
      child: BookDetailsPage(book: book),
    );
  }

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        context.read<BookBloc>().add(BookDeselected());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff113a83),
              ),
              onPressed: (){
                context.read<BookBloc>().add(BookDeselected());
              },
            ),
            backgroundColor: const Color(0XFFe5fbff),
            title: const Text(
                'Details',
                style: TextStyle(
                    color: Color(0xff113a83),
                    fontSize: 18
                )
            )),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book.title, style: theme.textTheme.headline6),
              Text(book.author, style: theme.textTheme.subtitle1),
            ],
          ),
        ),
      ),
    );
  }
}
