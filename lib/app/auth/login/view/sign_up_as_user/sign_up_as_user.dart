import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_up_as_user/controller_sign_up_as_user.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_up_as_user/model_sign_up_as_user.dart';
import 'package:medicare_ecommerce_app/app/auth/registration/view/registration_view.dart';
import 'package:medicare_ecommerce_app/app/home/view/home_view.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import '../../../../res/component/custom_button.dart';
import '../../../../res/component/custom_textfield.dart';

// class SignUpAsUser extends StatefulWidget {
//   const SignUpAsUser({super.key});

//   @override
//   State<SignUpAsUser> createState() => _SignUpAsUserState();
// }

// class _SignUpAsUserState extends State<SignUpAsUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Sign up',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25),
//               ),
//               Text(
//                 'please fill the credentials',
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(0.5),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               const CustomTextField(
//                 labelText: 'Full Name',
//                 prefixIcon: Icon(Icons.person),
//                 keyboardType: TextInputType.name,
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'Email',
//                   prefixIcon: Icon(Icons.email_outlined),
//                   keyboardType: TextInputType.emailAddress),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'Mobile Number',
//                   prefixIcon: Icon(Icons.phone),
//                   keyboardType: TextInputType.phone),
//               const SizedBox(
//                 height: 12,
//               ),
              
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'Store Address',
//                   prefixIcon: Icon(Icons.location_on_outlined),
//                   keyboardType: TextInputType.streetAddress),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'Store Name',
//                   prefixIcon: Icon(Icons.home_work_outlined),
//                   keyboardType: TextInputType.name),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'License Number',
//                   prefixIcon: Icon(Icons.edit_calendar_rounded),
//                   keyboardType: TextInputType.number),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                   labelText: 'Password',
//                   prefixIcon: Icon(Icons.key),
//                   suffixIcon: Icon(Icons.remove_red_eye),
//                   keyboardType: TextInputType.number),

//               const SizedBox(
//                 height: 40,
//               ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      customButton(
//                          onTap: () => Get.to(() => const HomeView()),
//                          borderColor: AppColors.primaryColor,
//                          btnName: 'Register',
//                          context: context,
//                          color: AppColors.primaryColor,
//                          textColor: Colors.white,
//                          border: Border.all(color: AppColors.primaryColor, width: 1.8)),
//                    ],
//                  ),
//                  const SizedBox(
//                    height: 40,
//                  ),
//                  Text('Already have an account?', style: TextStyle(color: Colors.black.withOpacity(0.5)),),
//                  InkWell(
//                      onTap: () => Get.back(),
//                      child: Text('Sign in', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
//                ],
//              )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



 

class SignUpAsUser extends StatefulWidget {
  const SignUpAsUser({super.key});

  @override
  State<SignUpAsUser> createState() => _SignUpAsUserState();
}

class _SignUpAsUserState extends State<SignUpAsUser> {
  final _formKey = GlobalKey<FormState>();
  final _controller = RegistrationController();

  final _storeNameController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _licenseNumberController = TextEditingController();

  bool _isPasswordVisible = false; // State variable for password visibility

  void _register() {
    if (_formKey.currentState!.validate()) {
      final model = RegistrationModel(
        storeName: _storeNameController.text,
        ownerName: _ownerNameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        password: _passwordController.text,
        address: _addressController.text,
        licenseNumber: _licenseNumberController.text,
      );
      _controller.registerUser(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Please fill the credentials',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    controller: _storeNameController,
                    labelText: 'Store Name',
                    prefixIcon: const Icon(Icons.home_work_outlined),
                    keyboardType: TextInputType.name,
                    validator: (value) =>
                        value!.isEmpty ? 'Store name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _ownerNameController,
                    labelText: 'Owner Name',
                    prefixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    validator: (value) =>
                        value!.isEmpty ? 'Owner name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _phoneController,
                    labelText: 'Mobile Number',
                    prefixIcon: const Icon(Icons.phone),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? 'Phone number is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty || !value.contains('@')
                        ? 'Enter a valid email'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _addressController,
                    labelText: 'Store Address',
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Address is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _licenseNumberController,
                    labelText: 'License Number',
                    prefixIcon: const Icon(Icons.edit_calendar_rounded),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'License number is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => value!.length < 6
                        ? 'Password must be 6+ characters'
                        : null,
                  ),
                  const SizedBox(height: 40),
                  customButton(
                    onTap: _register,
                    borderColor: AppColors.primaryColor,
                    btnName: 'Register',
                    context: context,
                    color: AppColors.primaryColor,
                    textColor: Colors.white,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
