import 'package:flutter/material.dart';
import 'package:ui_discoverapp/data.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<String> _locations = ['Poluare', 'Japan', 'Moscow', 'Landon'];
  int _activeLocation = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      left: false,
      right: false,
      bottom: true,
      minimum: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05,
        0,
        MediaQuery.of(context).size.width * 0.05,
        0,
      ),
      child: buidlMainColumn(context),
    ));
  }

  Column buidlMainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 35,
            )
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: _locationBAar(context),
        ),
        _articleList(context)
      ],
    );
  }

  Widget _locationBAar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _locations.map(
            (location) {
              bool _isActive =
                  _locations[_activeLocation] == location ? true : false;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                        fontSize: 15,
                        color: _isActive ? Colors.white : Colors.white54,
                        fontFamily: 'Montserrat'),
                  ),
                  _isActive
                      ? Container(
                          height: 5,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : Container()
                ],
              );
            },
          ).toList()),
    );
  }

  Widget _articleList(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: Offset(0, 6))
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(articles[index].image))),
                    child: _articleInfoColumn(context, index),
                  ),
                ),
              );
            }));
  }

  Widget _articleInfoColumn(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authorInfoColumn(context, index),
        )
      ],
    );
  }

  Widget _authorInfoColumn(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: NetworkImage('http://i.pravatar.cc/300'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles[index].author,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '3 hour ago',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        )
      ],
    );
  }
}
