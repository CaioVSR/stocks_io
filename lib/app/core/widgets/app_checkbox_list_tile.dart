import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/app/core/models/stock_model.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppCheckboxListTile extends StatelessWidget {
  const AppCheckboxListTile({
    Key key,
    @required this.stock,
    @required this.onChanged,
    @required this.index,
  }) : super(key: key);

  final Stock stock;
  final Function onChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    var variation = double.tryParse(((stock.currentValue / stock.openingValue) - 1).toStringAsFixed(2));
    if (variation.isNaN) {
      variation = 0.0;
    }

    return CheckboxListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 32.h,
            width: 2.w,
            color: AppColors.irisBlue,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    stock.tickerSymbol,
                    style: AppTextStyle.p(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    stock.name,
                    style: AppTextStyle.small(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cotação',
                  style: AppTextStyle.small(),
                ),
                Text(
                  'R\$ ${stock.currentValue.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: AppTextStyle.small(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Variação(Dia)',
                  style: AppTextStyle.small(),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(
                        variation == 0
                            ? Icons.arrow_forward
                            : variation < 0 ? Icons.arrow_downward : Icons.arrow_upward,
                        size: 12.sp,
                        color: variation == 0
                            ? AppColors.irisBlue
                            : variation < 0 ? AppColors.alizarin : AppColors.kellyGreen,
                      ),
                    ),
                    Text(
                      '${variation.toStringAsFixed(2).replaceAll('.', ',')} %',
                      style: AppTextStyle.small(
                        color: variation > 0
                            ? AppColors.kellyGreen
                            : variation < 0 ? AppColors.alizarin : AppColors.irisBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      value: stock.favored,
      onChanged: onChanged,
      activeColor: AppColors.tiber,
      checkColor: AppColors.irisBlue,
    );
  }
}
