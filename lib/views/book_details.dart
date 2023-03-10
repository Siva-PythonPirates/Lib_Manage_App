import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

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
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    AppServices imp = AppServiceImp();

    return _isLoading
        ? _buildLoadingScreen()
        : Scaffold(
            backgroundColor: bgColor,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login_bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06, vertical: 16),
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: imp.getSize(context, 300),
                              ),
                              /* SizedBox(
                              height: screenSize.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),*/
                              //const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, 100),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Title:",
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                  color: Colors.white,
                                                ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        '${widget.book['title'] ?? 'BOOK TITLE'}',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, 100),
                                        child: Text(
                                          "Author:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        '${widget.book['Author'] ?? 'Author'}',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, imp.getSize(context, 100)),
                                        child: Text(
                                          "Edition:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        '3',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, imp.getSize(context, 100)),
                                        child: Text(
                                          "Publisher:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        'Har Chand Publications',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, imp.getSize(context, 100)),
                                        child: Text(
                                          "Pages:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        '3100',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, imp.getSize(context, 100)),
                                        child: Text(
                                          "ISBN:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        '61-219-0611-3',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: imp.getSize(context, imp.getSize(context, 100)),
                                        child: Text(
                                          "Price:",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                              ),
                                        )),
                                    SizedBox(
                                      width: imp.getSize(context, 200),
                                      child: Text(
                                        'Rs.175',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -MediaQuery.of(context).size.width - 20,
                    left: -MediaQuery.of(context).size.width / 4,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 2,
                      width: MediaQuery.of(context).size.width * 1.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    )),
                Positioned(
                  top: imp.getSize(context, imp.getSize(context, 60)),
                  child: SizedBox(
                    width: imp.getSize(context, 350),
                    height: imp.getSize(context, 152),
                    child: Flexible(
                      child: Text(
                        '${widget.book['title'] ?? 'BOOK TITLE'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: imp.getSize(context, 34), color: bgColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: imp.getSize(context, imp.getSize(context, 240)),
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ],
            ),
            floatingActionButton: MaterialButton(
              color: const Color.fromARGB(255, 255, 112, 159),
              onPressed: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: imp.getSize(context, 16)),
                child: Text(
                  'Pre-Book',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: imp.getSize(context, 20),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitDualRing(
              color: Colors.pink,
              size: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'Loading Your Book',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
