import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/component/custom_text_form_field.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextFormField(
              hintText: '이메일을 입력해주세요',
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              hintText: '비밀번호를을 입력해주세요',
              onChanged: (String value) {},
            ),
          ],
        ),
      ),
    );
  }
}
