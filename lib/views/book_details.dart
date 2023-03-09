import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookDetails extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate an asynchronous operation to fetch book details.
    // After the operation is complete, set _isLoading to false to
    // show the book details screen.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return _isLoading
        ? _buildLoadingScreen()
        : Scaffold(
      appBar: AppBar(
        title: Text(widget.book['title'] ?? 'BOOK TITLE'),
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(
          headline6: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.2, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.3,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.network(
                  'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Title: ${widget.book['title'] ?? 'BOOK TITLE'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Author: ${widget.book['author'] ?? 'XXX'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Department: ${widget.book['department'] ?? 'XXX'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Description:',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.book['description'] ??
                    'No description available',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDualRing(
              color: Colors.pink,
              size: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'Loading Your Book',
              style: Theme.of(context).textTheme.subtitle1,

            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget Build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return _isLoading
        ? _buildLoadingScreen()
        : Scaffold(
      appBar: AppBar(
        title: Text(widget.book['title'] ?? 'BOOK TITLE'),
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(
          headline6: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.2, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.3,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.network(
                  'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Title: ${widget.book['title'] ?? 'BOOK TITLE'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Author: ${widget.book['author'] ?? 'XXX'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Department: ${widget.book['department'] ?? 'XXX'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Description:',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.book['description'] ??
                    'No description available',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}