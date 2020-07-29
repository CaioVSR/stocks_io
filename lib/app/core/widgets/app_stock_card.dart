import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/app/core/models/stock_model.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppStockCard extends StatelessWidget {
  final Stock stock;
  final Function onTap;
  final bool isPercentage;

  const AppStockCard({
    Key key,
    @required this.stock,
    @required this.onTap,
    this.isPercentage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variation = double.tryParse(((stock.currentValue / stock.openingValue) - 1).toStringAsFixed(2));
    if (variation.isNaN) {
      variation = 0.0;
    }

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
                        stock.tickerSymbol,
                        style: AppTextStyle.p(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        stock.name,
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
                      value: stock.currentValue,
                      backgroundColor: AppColors.tiber,
                      textColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: ValueColumn(
                      title: 'MIN(DIA)',
                      value: stock.minValue,
                      backgroundColor: AppColors.grey240,
                      textColor: AppColors.tiber,
                    ),
                  ),
                  Expanded(
                    child: ValueColumn(
                      title: 'MAX(DIA)',
                      value: stock.maxValue,
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
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (isPercentage)
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Icon(
                    value == 0 ? Icons.arrow_forward : value < 0 ? Icons.arrow_downward : Icons.arrow_upward,
                    size: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              Container(
                constraints: BoxConstraints(maxWidth: 50.w),
                child: Text(
                  isPercentage
                      ? '${value.toStringAsFixed(2)} %'
                      : 'R\$ ${(value.toStringAsFixed(2)).replaceAll('.', ',')}',
                  style: AppTextStyle.p(fontWeight: FontWeight.bold, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3)),
        ),
      ],
    );
  }
}
