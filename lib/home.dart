import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_journal/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              titleSpacing: 0,
              leading: _ProfilePic(),
              actions: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFFAFAFA)),
                  child: (SvgPicture.asset(
                    "assets/icons/Setting_alt_fill.svg",
                    color: MyColors.primary,
                  )),
                )
              ],
              elevation: 0),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home_bg.png"),
                    fit: BoxFit.cover),
                color: Colors.white,
              ),
              child: _Wrapper()),
        ),
      ),
    );
  }
}

class _ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(13, 0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
              )
            ],
            image: DecorationImage(
                image: AssetImage("assets/images/profile.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  int _currentShowingIndex = 1;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 1,
          aspectRatio: 16 / 9,
          onPageChanged: (idx, _) {
            setState(() {
              _currentShowingIndex = idx;
            });
          },
          enlargeCenterPage: true,
          viewportFraction: 0.75,
          height: height > 800
              ? height * 0.6
              : height > 600
                  ? height * 0.5
                  : height * 0.4,
          autoPlay: false,
          reverse: false),
      items: Store.blogs
          .map((el) => GestureDetector(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        boxShadow: el.imgIdx == _currentShowingIndex
                            ? [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 10.0,
                                    offset: Offset(2, 2))
                              ]
                            : null,
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: el.image,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.darken))),
                    child: el.imgIdx == _currentShowingIndex
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Padding(
                              // padding: const EdgeInsets.symmetric(
                              //     vertical: 30.0, horizontal: 10.0),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 15.0, 10.0, 30.0),
                              child: Stack(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.redAccent,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      el.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width < 400 ? 25 : 40,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    height > 600
                                        ? Text(
                                            el.date,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          )
                                        : SizedBox()
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ]),
                            ),
                          )
                        : null),
                onTap: () {
                  Navigator.pushNamed(context, "/blog", arguments: el);
                },
              ))
          .toList(),
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 45.0),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 400 ? 15.0 : 40.0,
            vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10.0)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/icons/Arhive_load_fill.svg"),
            SvgPicture.asset("assets/icons/Img_box_fill.svg")
          ],
        ),
      ),
    );
  }
}

class _Wrapper extends StatefulWidget {
  const _Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<_Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 60.0, bottom: 20.0),
            child: Text(
              "Your Journals",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: MyColors.primary,
                  height: 1,
                  fontSize: MediaQuery.of(context).size.width < 300 ? 30 : 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _Slider()
        ],
      ),
      _BottomBar(),
      Positioned(
          bottom: 30.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset("assets/icons/add.svg")],
          )),
    ]);
  }
}
