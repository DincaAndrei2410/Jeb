import 'package:flutter/material.dart';
import 'package:jaib/components/recent_transfers.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/models/transfer.dart';
import 'package:jaib/models/user.dart';
import 'package:jaib/screens/send_money/amount.dart';
import 'package:jaib/screens/send_money/personal_details.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
import 'package:jaib/services/current_user_service.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/transfer_service.dart';
import 'package:jaib/style.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<Transfer>> futureCountries;

  void initState() {
    futureCountries =
        TransferService.getTransfer(CurrentUserService.currentUser?.id ?? "");
  }

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
                Strings.SendMoney!,
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
            FutureBuilder<List<Transfer>>(
              future: futureCountries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RecentTransferContainer(
                      childWidget: ((snapshot.data?.length ?? 0) > 0)
                          ? RecentTransfers(snapshot.data!)
                          : Padding(
                              padding: EdgeInsets.all(50),
                              child: Column(
                                children: [
                                  Text(Strings.NoRecentTransfers!,
                                      style: MediumSizeTextStyle),
                                  SizedBox(height: 25),
                                  Image.asset(
                                    "assets/images/no_transfers.png",
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    Strings.SendMoneyClickButtonBellow!,
                                    style: MediumSizeTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator(
                    color: GreenColor,
                  );
                }
              },
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
          width: MediaQuery.of(context).size.width,
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
  CardBalanceWidget({
    Key? key,
  }) : super(key: key);

  User? currentUser;

  @override
  Widget build(BuildContext context) {
    currentUser = CurrentUserService.currentUser;

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
                    "AED ${(currentUser?.card?.balance ?? 0).toStringAsFixed(2)}",
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
