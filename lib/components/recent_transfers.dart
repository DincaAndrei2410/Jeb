import 'package:flutter/material.dart';
import 'package:jaib/models/months.dart';
import 'package:jaib/models/transfer.dart';
import 'package:jaib/services/language_service.dart';

import '../style.dart';

class RecentTransfers extends StatelessWidget {
  final List<Transfer> transfers;
  const RecentTransfers(this.transfers, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.RecentTransfer!,
            style: BoldMediumSizeTextStyle,
          ),
          Table(children: _buildTransferRows())
        ],
      ),
    ));
  }

  List<TableRow> _buildTransferRows() {
    return transfers.map((e) => _buildTableRow(e)).toList();
  }

  TableRow _buildTableRow(Transfer transfer) {
    return TableRow(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          transfer.isFirstInMonth ?? false
              ? const SizedBox(height: 16)
              : const SizedBox(height: 0),
          transfer.isFirstInMonth ?? false
              ? Text(
                  "${Months.AllMonths[transfer.date.month - 1]} ${transfer.date.year}",
                  style: SubtitleTextStyle,
                )
              : SizedBox.shrink(),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
                color: CellGreyBackground,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/transfer_icon.png",
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${transfer.beneficiary.name}",
                        style: BoldMediumSizeTextStyle,
                      ),
                      Text(
                        "${transfer.date.day}/${transfer.date.month}/${transfer.date.year}",
                        style: Regular14SizeTextStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "AED ${transfer.receiveAmount}",
                    style: BoldSmallSizeTextStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ]);
  }
}
