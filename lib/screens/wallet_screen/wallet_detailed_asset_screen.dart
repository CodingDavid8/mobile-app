import 'dart:math';

import 'package:deus_mobile/core/widgets/default_screen/default_screen.dart';
import 'package:deus_mobile/core/widgets/filled_gradient_selection_button.dart';
import 'package:deus_mobile/models/chart_data_point.dart';
import 'package:deus_mobile/screens/staking_vault_overview/widgets/chart_container.dart';
import 'package:deus_mobile/statics/my_colors.dart';
import 'package:deus_mobile/statics/styles.dart';
import 'package:flutter/material.dart';

class WalletDetailedAssetScreen extends StatelessWidget {
  static const url = '/wallet-detailed';


  Future<List<ChartDataPoint>> _dataPoint() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
        100,
        (index) => ChartDataPoint(
            dateTime: DateTime(2021, 12, 30),
            value: Random().nextInt(500) / 100));
  }

  static const Divider _divider = Divider(height: 30, thickness: 1,);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Center(
            child: Text(
              'dTSLA',
              style: MyStyles.whiteBigTextStyle,
            ),
          ),
          ChartContainer(
            showHeader: false,
            chartPoints: _dataPoint(),
          ),
          SizedBox(height: 45),
          Divider(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Equity',
                  style: MyStyles.whiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(width: 5),
                Text(
                  '43.42%',
                  style: MyStyles.lightWhiteSmallTextStyle
                      .copyWith(fontSize: 12.5),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '\$79,342.34',
              style: MyStyles.whiteBigTextStyle,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/stocks/tesla.png'),
                  radius: 10,
                ),
                SizedBox(width: 5),
                Text(
                  '43.32552  dTSLA',
                  style:
                      MyStyles.lightWhiteMediumTextStyle.copyWith(fontSize: 15),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Average Cost',
                  style:
                      MyStyles.lightWhiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  '\$657.24',
                  style: MyStyles.whiteBigTextStyle.copyWith(fontSize: 15),
                )
              ],
            ),
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profit/Loss',
                  style:
                      MyStyles.lightWhiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  '+10.23% (\$3,425.94)',
                  style: MyStyles.whiteBigTextStyle
                      .copyWith(fontSize: 15, color: MyColors.ToastGreen),
                )
              ],
            ),
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24h Return',
                  style:
                      MyStyles.lightWhiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                Text('+1.23 (\$325.94)',
                    style: MyStyles.whiteBigTextStyle
                        .copyWith(fontSize: 15, color: MyColors.ToastGreen))
              ],
            ),
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: FilledGradientSelectionButton(
                    label: 'BUY',
                    gradient: MyColors.blueToPurpleGradient,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                    child: FilledGradientSelectionButton(
                  label: 'SELL',
                  gradient: MyColors.blueToPurpleGradient,
                ))
              ],
            ),
          ),
          _divider,
        ],
      ),
    ));
  }
}
