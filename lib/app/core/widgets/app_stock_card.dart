import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppStockCard extends StatelessWidget {
  final String tickerSymbol;
  final String stockName;
  final double currentValue;
  final double minValue;
  final double maxValue;
  final double openingValue;
  final Function onTap;
  final bool isPercentage;

  const AppStockCard({
    Key key,
    @required this.stockName,
    @required this.tickerSymbol,
    @required this.currentValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onTap,
    @required this.openingValue,
    this.isPercentage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variation = ((currentValue / openingValue) - 1);

    return Card(
      elevation: 6,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        tickerSymbol,
                        style: AppTextStyle.p(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        stockName,
                        style: AppTextStyle.small(),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.delete_outline),
                  onTap: onTap,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ValueColumn(
                      title: 'COTAÇÃO',
                      value: currentValue,
                      backgroundColor: AppColors.tiber,
                      textColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: ValueColumn(
                      title: 'MIN(DIA)',
                      value: minValue,
                      backgroundColor: AppColors.grey240,
                      textColor: AppColors.tiber,
                    ),
                  ),
                  Expanded(
                    child: ValueColumn(
                      title: 'MAX(DIA)',
                      value: maxValue,
                      backgroundColor: AppColors.grey240,
                      textColor: AppColors.tiber,
                    ),
                  ),
                  Expanded(
                    child: ValueColumn(
                      isPercentage: true,
                      title: 'VARIAÇÃO(DIA)',
                      value: variation,
                      backgroundColor: variation > 0
                          ? AppColors.kellyGreen
                          : variation < 0 ? AppColors.alizarin : AppColors.irisBlue,
                      textColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ValueColumn extends StatelessWidget {
  final String title;
  final double value;
  final Color backgroundColor;
  final Color textColor;
  final bool isPercentage;

  const ValueColumn(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.backgroundColor,
      @required this.textColor,
      this.isPercentage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppTextStyle.tiny(),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            isPercentage ? '${value.toStringAsFixed(2)} %' : 'R\$ ${(value.toStringAsFixed(2)).replaceAll('.', ',')}',
            style: AppTextStyle.p(fontWeight: FontWeight.bold, color: textColor),
          ),
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3)),
        ),
      ],
    );
  }
}
