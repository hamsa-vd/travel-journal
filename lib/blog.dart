import 'package:flutter/material.dart';
import 'package:travel_journal/constants.dart';

class BlogPage extends StatelessWidget {
  final Blog blog;
  BlogPage({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: BackButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(15),
              //   child: ShaderMask(
              //     blendMode: BlendMode.darken,
              //     shaderCallback: (bounds) => LinearGradient(colors: [
              //       Colors.black54,
              //       Colors.transparent,
              //       Colors.black54
              //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              //         .createShader(bounds),
              Container(
                height: height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: blog.image,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken))),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 30.0),
                    child: Column(
                      children: [
                        Text(
                          blog.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          blog.date,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Journal",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: MyColors.secondary,
                              ),
                              Text(
                                "Swipe up to Read",
                                style: TextStyle(color: MyColors.secondary),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(
                      blog.description,
                      maxLines: height < 675 ? 2 : 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: MyColors.secondary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: MyColors.primary),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit Journal",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 10.0),
                            Icon(Icons.edit)
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
