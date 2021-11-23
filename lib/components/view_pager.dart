import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaib/models/view_pager_model.dart';
import 'package:jaib/style.dart';

class PagerWithDots extends StatefulWidget {
  List<ViewPagerModel> models;
  Size size;

  PagerWithDots(this.models, this.size, {Key? key}) : super(key: key);

  @override
  _PagerWithDotsState createState() => _PagerWithDotsState();
}

class _PagerWithDotsState extends State<PagerWithDots> {
  PageController _controller = PageController();
  List<Widget> _pages = [];

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  int? _currentPage;

  @override
  void initState() {
    for (var model in widget.models) {
      _pages.add(Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: HeadlineTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Image.asset(
            "assets/images/${model.imagePath}",
            fit: BoxFit.scaleDown,
            height: 0.35 * widget.size.height,
            width: 0.95 * widget.size.width,
          ),
        ],
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (int page) {
              getChangedPageAndMoveBar(page);
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: DotsIndicator(
                  page: _currentPage,
                  itemCount: _pages.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    _currentPage = page;
    setState(() {});
  }
}

class DotsIndicator extends StatelessWidget {
  DotsIndicator({
    this.page,
    this.itemCount,
  });

  /// The PageController that this DotsIndicator is representing.
  final int? page;

  /// The number of items managed by the PageController
  final int? itemCount;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    bool isSelected = ((page ?? 0) % (itemCount ?? 0)) == index;
    return Container(
        width: _kDotSpacing,
        child: InkResponse(
          child: Container(
              width: _kDotSize,
              height: _kDotSize,
              decoration: BoxDecoration(
                  color: isSelected ? GreenColor : Colors.white,
                  borderRadius: isSelected ? BorderRadius.circular(10) : null,
                  shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
                  border: Border.all(color: GreenColor))),
        ));
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
