import 'package:flutter/material.dart';
import 'package:jaib/components/recent_transfers.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/models/transfer.dart';
import 'package:jaib/screens/send_money/amount.dart';
import 'package:jaib/screens/send_money/personal_details.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
import 'package:jaib/services/transfer_service.dart';
import 'package:jaib/style.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        child: BottomAppBar(
            color: GreenColor,
            child: MaterialButton(
              onPressed: () => {NavigateToSendMoneyScreen(context)},
              child: Text(
                "Send Money",
                style: WhiteHeadlineTextStyle,
              ),
            )),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: DashboardBackgroundColor,
            ),
            RecentTransferContainer(
              childWidget: RecentTransfers(TransferService.Transfers),
            ),
            CardBalanceWidget(),
          ],
        ),
      ),
    );
  }

  void NavigateToSendMoneyScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AmountPage()));
  }
}

class RecentTransferContainer extends StatelessWidget {
  final Widget? childWidget;

  const RecentTransferContainer({
    this.childWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 220),
      child: Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            child: childWidget,
          )),
    );
  }
}

class CardBalanceWidget extends StatelessWidget {
  const CardBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 80, left: 25, right: 25),
        child: Container(
          height: 180,
          child: Stack(children: [
            Image.asset(
              "assets/images/dashboard_card.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 28, right: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/dashboard_card_chip.png",
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                      Image.asset("assets/images/card_type_logo.png",
                          fit: BoxFit.fill, width: 35, height: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "AED 2,500.00",
                    style: BalanceTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/images/secure_pin_image.png",
                    fit: BoxFit.fill,
                    width: 140,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
