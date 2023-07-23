import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:size_config/utils/size_config.dart';
import 'package:size_config/utils/theme_provider/app_state_notifier.dart';

class ResultWidget extends StatelessWidget {
  final double onChangeHeight;
  final double onChangeWidth;
  final bool isHeight;

  const ResultWidget({
    Key? key,
    required this.onChangeHeight,
    required this.onChangeWidth,
    required this.isHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppStateNotifier>(context);
    return InkWell(
      onTap: () {
        if (onChangeHeight != 0.0 || onChangeWidth != 0.0) {
          Clipboard.setData(ClipboardData(
                  text: isHeight
                      ? onChangeHeight.toStringAsFixed(2).toString()
                      : onChangeWidth.toStringAsFixed(2).toString()))
              .then((value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(isHeight ? "Height Copied To Clipboard!" : "Width Copied To Clipboard!")));
          });
        }
      },
      child: Container(
        width: SizeConfig.relativeWidth(25),
        height: SizeConfig.relativeHeight(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: theme.isDarkMode ? Colors.white54 : Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            isHeight
                ? onChangeHeight.toStringAsFixed(2)
                : onChangeWidth.toStringAsFixed(2),
            style: TextStyle(
              color: Colors.red,
              fontSize: SizeConfig.setSp(14).toDouble(),
            ),
          ),
        ),
      ),
    );
  }
}
