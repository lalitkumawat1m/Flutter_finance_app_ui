// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_finance_app/theme/colors.dart';
import 'package:flutter_finance_app/widgets/auth_page_text.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff67727d),
            )),
        backgroundColor: primary,
        elevation: 0,
        title: const SmallText(text: 'Account security', size: 20),
        centerTitle: true,
      ),
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: SimpleListTile(
              onpressed: () {},
              title: 'Change Password',
            ),
          ),
          Card(
            child: SimpleListTile(
              onpressed: () {},
              title: 'Delete account',
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallText(text: 'Biometric', size: 18),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      isSwitched = value;
                      setState(() {
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.blue,
                    activeColor: white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SimpleListTile extends StatelessWidget {
  final String title;
  final Function() onpressed;
  const SimpleListTile({
    super.key,
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onpressed,
    );
  }
}

class ContainerTile extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final IconData icon;
  final IconData? icon1;
  final Function()? onpressed;

  const ContainerTile({
    required this.icon,
    this.onpressed,
    this.subtitle,
    required this.title,
    this.icon1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.03),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: subtitle,
        leading: Icon(icon),
        trailing: Icon(icon1),
      ),
    );
  }
}
