import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  List<Widget> pages = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          'assets/images/Home/page_view_image.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          'assets/images/Home/page_view_image.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          'assets/images/Home/page_view_image.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];

  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // if (_currentPage < 5) {
      _currentPage++;
      // } else {
      //   _currentPage = 0;
      // }

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white60,
          elevation: 1.0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/qatar_flag.png',
              scale: 8.5,
            ),
          ),
          title: const Column(
            children: [
              Text(
                "Deliver to",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "Qatar",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/Home/notification.png'),
              tooltip: 'Notification Icon',
              color: Colors.black,
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Image.asset('assets/images/Home/trolly.png'),
              tooltip: 'cart Icon',
              color: Colors.black,
              onPressed: () {},
            ), //IconButton
          ], //IconButton
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    // print(index);
                    return pages[index % 3];
                  },
                  reverse: false,
                  onPageChanged: (int i) {
                    _currentPage = i;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: const SlideEffect(
                      spacing: 5.0,
                      radius: 4.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black),
                ),
              ),
              containerHeading('Shop by'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        containerShopBy(img: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Letterbox'),
                        containerShopBy(
                            img: 'assets/images/Home/Most_Selling2.png', msg: 'Flowers'),
                        containerShopBy(img: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Hand Bouduets'),
                        containerShopBy(img: 'assets/images/Home/Most_Selling2.png',
                            msg: 'Letterbox'),
                        containerShopBy(
                            img: 'assets/images/Home/Most_Selling1.png', msg: 'Flowers'),
                        containerShopBy(img: 'assets/images/Home/Most_Selling2.png',
                            msg: 'Hand Bouduets'),
                      ],
                    ),
                  ),
                ),
              ),
              containerHeading('Your Upcoming Occasions'),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(16.0)),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Image.asset(
                            'assets/images/Home/calendar-icon.png',
                            height: 80,
                            width: 80),
                      ),
                    ),
                    Flexible(
                      // width:  MediaQuery.of(context).size.width,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "You don't have any occasions this week",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Add More occasions',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/images/Home/eid.jpg',
                          width: 250,
                          height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "Eid",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('View all',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                      )),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 12,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              containerHeading('Shop by occasion'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      containerShopByOccasion(
                          path: 'assets/images/Home/Most_Selling1.png',
                          msg: 'Letterbox',
                          height: 150,
                          width: 250),
                      containerShopByOccasion(
                          path: 'assets/images/Home/Most_Selling2.png',
                          msg: 'Flowers',
                          height: 150,
                          width: 250),
                      containerShopByOccasion(
                          path: 'assets/images/Home/Most_Selling1.png',
                          msg: 'Letterbox',
                          height: 150,
                          width: 250),
                      containerShopByOccasion(
                          path: 'assets/images/Home/Most_Selling2.png',
                          msg: 'Flowers',
                          height: 150,
                          width: 250),
                    ],
                  ),
                ),
              ),
              containerHeading('DIY Box'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        diyBox(
                            img: 'assets/images/Home/Most_Selling1.png',
                            text1: 'DIY Box',
                            text2: 'Choose your own DIY...',
                            text3: 'QAR 23'),
                        diyBox(
                            img: 'assets/images/Home/Most_Selling2.png',
                            text1: 'DIY Box',
                            text2: 'Choose your own DIY...',
                            text3: 'QAR 23'),
                        diyBox(
                            img: 'assets/images/Home/Most_Selling1.png',
                            text1: 'DIY Box',
                            text2: 'Choose your own DIY...',
                            text3: 'QAR 23'),
                        diyBox(
                            img: 'assets/images/Home/Most_Selling2.png',
                            text1: 'DIY Box',
                            text2: 'Choose your own DIY...',
                            text3: 'QAR 23'),
                      ],
                    ),
                  ),
                ),
              ),
              containerHeading('Subscriptions'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        diyBox(
                            img: 'assets/images/Home/Most_Selling2.png',
                            text1: 'Weekly plant Subscription',
                            text2: 'Delivered weekly',
                            text3: 'QAR 196 per month'),
                        diyBox(
                            img: 'assets/images/Home/Most_Selling1.png',
                            text1: 'Weekly plant Subscription',
                            text2: 'Delivered weekly',
                            text3: 'QAR 196 per month'),
                      ],
                    ),
                  ),
                ),
              ),
              containerHeading('Shop by Designer'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Letterbox',
                            width: 150,
                            height: 150),
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Flowers',
                            width: 150,
                            height: 150),
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Hand Bouduets',
                            width: 150,
                            height: 150),
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Flowers',
                            width: 150,
                            height: 150),
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Letterbox',
                            width: 150,
                            height: 150),
                        containerShopByOccasion(
                            path: 'assets/images/Home/Most_Selling1.png',
                            msg: 'Hand Bouduets',
                            width: 150,
                            height: 150),
                      ],
                    ),
                  ),
                ),
              ),
              containerHeading('Collaborated with'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      containerCollaboratedWith(
                          topImage: 'assets/images/Home/testImage1.png',
                          bottomImage: 'assets/images/Home/godiva.png'),
                      containerCollaboratedWith(
                          topImage: 'assets/images/Home/testImage2.png',
                          bottomImage: 'assets/images/Home/godiva.png'),
                      containerCollaboratedWith(
                          topImage: 'assets/images/Home/testImage1.png',
                          bottomImage: 'assets/images/Home/godiva.png'),
                      containerCollaboratedWith(
                          topImage: 'assets/images/Home/testImage2.png',
                          bottomImage: 'assets/images/Home/godiva.png'),
                    ],
                  ),
                ),
              ),
              containerHeading('Most selling'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling2.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling1.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling2.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling1.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                      ],
                    ),
                  ),
                ),
              ),
              containerHeading('Whats new'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling2.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling1.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling2.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                        containerMostSelling(
                            img: 'assets/images/Home/Most_Selling1.png',
                            msg1: 'White Lilies',
                            msg2: 'QAR 17'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/nev_home.png'),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/nev_search.png'),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/nev_categories.png'),
              label: 'more',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/favourite_outline.png'),
              label: 'favourite',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/nev_account.png'),
              label: 'contact',
            )
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ));
  }

  containerHeading<Widget>(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () {
              // print(title);
            },
            child: Text(
              'View all',
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  containerShopBy<Widget>({required String img, required String msg}) {
    return Container(
      width: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img, height: 90, width: 90, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  containerShopByOccasion<Widget>(
      {required String path,
      required String msg,
      required double width,
      required double height}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        // color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(path,
                width: width, height: height, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(msg,
                style: const TextStyle(fontSize: 18),
                textDirection: TextDirection.ltr),
          ),
        ],
      ),
    );
  }

  diyBox<Widget>(
      {required String img,
      required String text1,
      required String text2,
      required String text3}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              width: 100,
              height: 100,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.all(8.0),
                child: Text(text1,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(text2, style: const TextStyle(fontSize: 16)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text3, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  containerCollaboratedWith<Widget>(
      {required String topImage, required String bottomImage}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 150,
      width: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: 100,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(bottomImage, height: 50, width: 50),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(topImage, height: 90, width: 90),
          ),
        ],
      ),
    );
  }

  containerMostSelling<Widget>({required String img, required String msg1, required String msg2}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.all(8.0),

      // width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img, height: 180, width: 180, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(msg1,
                style: const TextStyle(fontSize: 16),
                textDirection: TextDirection.ltr),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(msg2,
                style: const TextStyle(fontSize: 16),
                textDirection: TextDirection.ltr),
          ),
        ],
      ),
    );
  }
}
