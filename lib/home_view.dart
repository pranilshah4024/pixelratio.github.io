import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:size_config/custom_text_field.dart';
import 'package:size_config/result_widget.dart';
import 'package:size_config/utils/size_config.dart';
import 'package:size_config/utils/theme_provider/app_state_notifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController screenHeightController = TextEditingController();
  TextEditingController enteredHeightController = TextEditingController();
  TextEditingController screenWidthController = TextEditingController();
  TextEditingController enteredWidthController = TextEditingController();

  double? screenHeight;
  double? enteredHeight;
  double? screenWidth;
  double? enteredWidth;
  bool onChangeHeightEditable = false;
  bool onChangeWidthEditable = false;
  double onChangeHeight = 0.0;
  double onChangeWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        SizeConfig().init(ctx, constraints);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Calculate Pixel Ratio Utility'),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.relativeWidth(5)),
                child: FlutterSwitch(
                  width: SizeConfig.relativeWidth(6),
                  height: 30.0,
                  valueFontSize: 14.0,
                  toggleSize: 30.0,
                  value: Provider
                      .of<AppStateNotifier>(context)
                      .isDarkMode,
                  borderRadius: 30.0,
                  padding: 5.0,
                  showOnOff: true,
                  activeIcon: Icon(
                    Icons.sunny,
                    color: Colors.blue,
                  ),
                  inactiveIcon: Icon(Icons.sunny_snowing, color: Colors.red),
                  activeText: "Light",
                  inactiveText: "Dark",
                  activeColor: Colors.white54,
                  inactiveColor: Colors.black54,
                  onToggle: (state) {
                    Provider.of<AppStateNotifier>(context, listen: false)
                        .updateTheme(state);
                  },
                ),
              ),
            ],

          ),
          body: _getBody(),
        );
      },
    );
  }


  Widget _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            SizedBox(
              width: SizeConfig.relativeWidth(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headingWidget(title: "Height"),
                  SizeConfig.verticalSpacer(8),
                  SizedBox(
                    width: SizeConfig.relativeWidth(35),
                    child: CustomTextField(
                      "Enter Screen Height",
                      controller: screenHeightController,
                      onChanged: (value) {
                        screenHeight =
                            value.isNotEmpty ? double.parse(value) / 100 : 0.0;
                        onChangeHeightEditable = value.isNotEmpty ? true : false;
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                    ),
                  ),
                  SizeConfig.verticalSpacer(8),
                  SizedBox(
                    width: SizeConfig.relativeWidth(35),
                    child: CustomTextField(
                      "Enter Height",
                      editable: onChangeHeightEditable,
                      controller: enteredHeightController,
                      onChanged: (value) {
                        onChangeHeight = value.isNotEmpty
                            ? double.parse(value) / screenHeight!
                            : 0.0;
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                    ),
                  ),
                  SizeConfig.verticalSpacer(10),
                  ResultWidget(
                    isHeight: true,
                    onChangeHeight: onChangeHeight,
                    onChangeWidth: onChangeWidth,
                  )
                ],
              ),
            ),
            SizedBox(
              width: SizeConfig.relativeWidth(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headingWidget(title: "Width"),
                  SizeConfig.verticalSpacer(8),
                  SizedBox(
                    width: SizeConfig.relativeWidth(35),
                    child: CustomTextField(
                      "Enter Screen Width",
                      controller: screenWidthController,
                      onChanged: (value) {
                        screenWidth =
                            value.isNotEmpty ? double.parse(value) / 100 : 0.0;
                        onChangeWidthEditable = value.isNotEmpty ? true : false;
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                    ),
                  ),
                  SizeConfig.verticalSpacer(8),
                  SizedBox(
                    width: SizeConfig.relativeWidth(35),
                    child: CustomTextField(
                      "Enter Width",
                      editable: onChangeWidthEditable,
                      controller: enteredWidthController,
                      onChanged: (value) {
                        onChangeWidth = value.isNotEmpty
                            ? double.parse(value) / screenWidth!
                            : 0.0;
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                    ),
                  ),
                  SizeConfig.verticalSpacer(10),
                  ResultWidget(
                    isHeight: false,
                    onChangeHeight: onChangeHeight,
                    onChangeWidth: onChangeWidth,
                  )
                ],
              ),
            ),
          ],
        ),
        Text("Made In ♥ With Flutter , Developed By Pranil Shah")
      ],
    );
  }
  

  headingWidget({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.setSp(16).toDouble(),
      ),
    );
  }
}
