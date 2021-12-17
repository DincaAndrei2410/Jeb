import 'package:flutter/material.dart';
import 'package:jaib/services/send_money_details.dart';

import '../style.dart';

class Summary extends StatelessWidget {
  SendMoneyDetails summaryDetails;
  Summary(this.summaryDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DisabledButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Table(
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "AED ${summaryDetails.sendAmount}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "${summaryDetails.firstName} ${summaryDetails.lastName}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bank Name: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "${summaryDetails.bankName}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account number: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "${summaryDetails.accountNumber}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Country: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "${summaryDetails.country}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Purpose: ",
                      style: BoldSmallSizeTextStyle,
                    ),
                    Text(
                      "${summaryDetails.purpose}",
                      style: Regular14SizeTextStyle,
                    )
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
