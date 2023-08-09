import 'package:flutter/material.dart';
import 'package:flutter_finance_app/pages/account_security.dart';
import 'package:flutter_finance_app/pages/daily_page.dart';
import 'package:flutter_finance_app/provider/dark_theme_provider.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:flutter_finance_app/widgets/auth_page_text.dart';
import 'package:flutter_finance_app/widgets/button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
            child: Column(
          children: [
            const LargeContainer(
                child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: 'Hello, ', size: 20),
                    SmallText(text: 'John Doe', size: 20)
                  ],
                )
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            ContainerTile(
              icon: Icons.person_3_outlined,
              title: 'My Account',
              icon1: Icons.arrow_forward_ios,
              onpressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerTile(
              icon: Icons.contact_support_outlined,
              title: 'Online support',
              icon1: Icons.arrow_forward_ios,
              onpressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerTile(
              icon: Icons.note_outlined,
              title: 'Loan Terms',
              icon1: Icons.arrow_forward_ios,
              onpressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerTile(
              icon: Icons.verified_user_outlined,
              title: 'Account security',
              icon1: Icons.arrow_forward_ios,
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecurityPage(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallText(text: 'Biometric', size: 18),
                    Switch(
                      onChanged: (bool value) {
                        setState(() {
                          themeState.setDarkTheme = value;
                        });
                      },
                      value: themeState.getDarkTheme,
                      activeTrackColor: Colors.blue,
                      activeColor: white,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                minHeight: 60,
                onPressed: () {},
                color: buttoncolor,
                title: 'Sign Out'),
            const SizedBox(
              height: 4,
            ),
            const SmallText(
              text: 'Developed by Arinze Precious',
              size: 14,
            ),
          ],
        )));
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
        onTap: onpressed,
        title: Text(title),
        subtitle: subtitle,
        leading: Icon(icon),
        trailing: Icon(icon1),
      ),
    );
  }
}
