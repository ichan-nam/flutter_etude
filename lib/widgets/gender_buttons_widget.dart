import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderButtons extends StatefulWidget {
  const GenderButtons({
    super.key,
  });

  @override
  State<GenderButtons> createState() => _GenderButtonsState();
}

class _GenderButtonsState extends State<GenderButtons> {
  // private 클래스 안에 있어서 굳이 _로 시작할 필요 없음
  late SharedPreferences prefs;
  // build()가 initPrefs() 뒤에 실행된다고 보장할 수 없기 때문에 초기화 필수
  String selection = GenderEnum.all.urlString;

  // Rather than awaiting on asynchronous work directly inside of initState,
  // call a separate method to do this work without awaiting it.
  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    // setState() 없으면 all에 고정
    setState(() {
      selection = prefs.getString('gender') ?? GenderEnum.all.urlString;
    });
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: GenderEnum.values
          .map(
            (e) => TextButton(
              onPressed: () {
                prefs.setString('gender', e.urlString);
                setState(() {
                  selection = e.urlString;
                });
              },
              style: TextButton.styleFrom(
                foregroundColor: e.urlString == selection
                    ? CustomColors.customPink3
                    : Colors.black38,
                backgroundColor: e.urlString == selection
                    ? CustomColors.customWhite
                    : CustomColors.customPink1.withOpacity(0.7),
                elevation: 4,
              ),
              child: Text(e.toString()),
            ),
          )
          .toList(),
    );
  }
}
