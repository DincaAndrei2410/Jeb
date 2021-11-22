import 'package:flutter/material.dart';
import 'package:jaib/style.dart';

class RateContainer extends StatelessWidget {
  final String currency;
  final String rateValue;
  final String day;
  final bool isHighlighted;

  const RateContainer(
      this.currency, this.rateValue, this.day, this.isHighlighted,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isHighlighted ? GreenColor : CellGreyBackground,
                  width: 2),
              color: DisabledButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currency,
                  style: SubtitleTextStyle,
                ),
                Text(
                  rateValue,
                  style: BoldMediumSizeTextStyle,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(day, style: BoldVerySmallSizeTextStyle)
      ],
    );
  }
}
