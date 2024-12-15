import 'package:admin_ecommerce/screens/product_list_screen/components/app_bar.dart';
import 'package:admin_ecommerce/screens/product_profile_screen.dart/components/profile_menu.dart';
import 'package:admin_ecommerce/widgets/section_heading.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/image/user.png'),
                      radius: 30,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change Profile Picture',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: 16,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Minh Thang Tran',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'minhthangtran@gmail',
              ),
              ProfileMenu(
                  onPressed: () {}, title: 'Phone Number', value: '0356458854'),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(
                  onPressed: () {}, title: 'Date of Birth', value: '31/10/2002')
            ],
          ),
        ),
      ),
    );
  }
}
