import 'dart:math';

import 'package:deus_mobile/core/widgets/custom_chart.dart';
import 'package:deus_mobile/core/widgets/default_screen/default_screen.dart';
import 'package:deus_mobile/locator.dart';
import 'package:deus_mobile/models/chart_data_point.dart';
import 'package:deus_mobile/models/portfolio_asset.dart';
import 'package:deus_mobile/routes/navigation_service.dart';
import 'package:deus_mobile/screens/staking_vault_overview/widgets/chart_container.dart';
import 'package:deus_mobile/screens/wallet_screen/wallet_detailed_asset_screen.dart';
import 'package:deus_mobile/statics/my_colors.dart';
import 'package:deus_mobile/statics/styles.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  static const url = 'wallet-screen';

  List<ChartDataPoint> _testList() {}

  Future<List<ChartDataPoint>> _dataPoint() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
        100,
        (index) => ChartDataPoint(
            dateTime: DateTime(2021, 12, 30),
            value: Random().nextInt(500) / 100));
  }

  Future<List<PortfolioAsset>> _assetFuture() async {
    Future.delayed(Duration(seconds: 2));
    return [
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),
      PortfolioAsset('assets/images/stocks/tesla_black.png', 'Tesla Inc', 'dTSLA', 3425.94, 10.23, 657.24, 1.23, 325.94, 32352.24),

    ];
  }

  static const SizedBox _smallHeightDivider = SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          Text(
            'Your dAsset Portfolio',
            style: MyStyles.lightWhiteSmallTextStyle.copyWith(fontSize: 12.5),
          ),
          ChartContainer(
            chartPoints: _dataPoint(),
            showHeader: false,
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Assets',
                  style: MyStyles.whiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(width: 5),
                Text(
                  '36',
                  style:
                      MyStyles.lightWhiteMediumTextStyle.copyWith(fontSize: 15),
                ),
                Spacer(),
                Text(
                  'Show All',
                  style:
                      MyStyles.gradientMediumTextStyle.copyWith(fontSize: 15),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1),
          FutureBuilder<List<PortfolioAsset>>(
            future: _assetFuture(),
            builder: (ctx, snap) {
              return snap.connectionState == ConnectionState.done
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, ind) =>
                          _buildListTile(ctx, snap.data[ind]),
                      separatorBuilder: (_, __) => Divider(
                            thickness: 1,
                            height: 30,
                          ),
                      itemCount: snap.data.length)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          SizedBox(height: 100)
        ],
      ),
    ));
  }

  Widget _buildListTile(BuildContext context, PortfolioAsset asset) {
    return GestureDetector(
      // onTap: () => locator<NavigationService>()
      //     .navigateTo(WalletDetailedAssetScreen.url, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: MyColors.blueToPurpleGradient),
              ),
              Container(
                height: 36,
                width: 36,
                child: ClipOval(child: Container(
                    color: Colors.white,
                    child: Image.asset(asset.img))),
              )
            ]),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            asset.shortName,
                            style: MyStyles.whiteMediumTextStyle
                                .copyWith(fontSize: 15),
                          ),
                          SizedBox(width: 5),
                          Text('43.23456',
                              style: MyStyles.lightWhiteSmallTextStyle
                                  .copyWith(fontSize: 12.5))
                        ],
                      ),
                      Text(
                        asset.fullName,
                        style: MyStyles.lightWhiteSmallTextStyle
                            .copyWith(fontSize: 12.5),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${asset.fullValueOfPosition}',
                        style: MyStyles.whiteMediumTextStyle
                            .copyWith(fontSize: 12.5),
                      ),
                      Text(
                        '+${asset.relativePerformance}% (\$${asset.absolutePerformance})',
                        style: MyStyles.whiteSmallTextStyle.copyWith(
                            fontSize: 12.5, color: MyColors.ToastGreen),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
