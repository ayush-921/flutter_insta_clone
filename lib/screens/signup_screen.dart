import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/resources/auth_methods.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/utils/colors.dart';
import 'package:flutter_insta_clone/widgets/input_textField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _unameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _unameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //instagram svg logo
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 50,
              ),

              const SizedBox(
                height: 25,
              ),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 54,
                    backgroundImage: NetworkImage(
                        'https://png.pngtree.com/png-vector/20190429/ourlarge/pngtree-vector-business-men-icon-png-image_998295.jpg'),
                  ),
                  Positioned(
                    bottom: -15,
                    left: 70,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              //uname
              InputTextField(
                textEditingController: _unameController,
                hintText: "Username",
                textInputType: TextInputType.text,
              ),

              const SizedBox(
                height: 24,
              ),

              //email text field
              InputTextField(
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 24,
              ),

              //pasword text field
              InputTextField(
                textEditingController: _passController,
                hintText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),

              const SizedBox(
                height: 24,
              ),

              //bio
              InputTextField(
                textEditingController: _bioController,
                hintText: "Bio",
                textInputType: TextInputType.text,
              ),

              const SizedBox(
                height: 24,
              ),

              //SignUpButton
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUpuser(
                    email: _emailController.text,
                    uname: _unameController.text,
                    password: _passController.text,
                    bio: _bioController.text,
                  );
                  print(res);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 2,
                child: Container(),
              ),

              const Divider(
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Text('Already have an account?  '),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        'Log In.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
