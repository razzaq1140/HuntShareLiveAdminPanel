import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hunt_share_live_admin_panel/common/utils/validations.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

import '../../../common/constants/global_variables.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../routes/go_route.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureConfirmText = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFFF8F3EE), // Background color
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  'Let’s Sign Up.!',
                  style: textTheme(context).headlineSmall?.copyWith(
                      color: const Color(0xff696969),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill the information to login account!',
                  style: textTheme(context).bodyLarge?.copyWith(
                      fontSize: 16,
                      color: const Color(0xff696969),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height * 0.06),
                CustomTextFormField(
                  controller: _userName,
                  hint: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      Validation.fieldValidation(value, "username"),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validation.emailValidation(value),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscureText: obscure,
                      validator: (value) =>
                          Validation.passwordValidation(value),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureText.value = !_obscureText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureConfirmText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _confirmPasswordController,
                      hint: 'Confirmed password',
                      obscureText: obscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the confirm password";
                        }
                        if (value != _passwordController.text) {
                          return "Password and Confirm Password do not match";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureConfirmText.value =
                              !_obscureConfirmText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, loading, child) {
                    return CustomButton(
                      btnText: "Sign Up",
                      isLoading: loading, // ✅ isLoading ka state manage hoga
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          isLoading.value = true;

                          isLoading.value = false;

                          // ✅ Navigate only if user created successfully
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Don’t have an Account?'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRoute.loginPage);
                            },
                          text: 'Sign In',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff7D3BF5),
                              color: Color(0xff7D3BF5)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      tabletLayout: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFFF8F3EE), // Background color
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  'Let’s Sign Up.!',
                  style: textTheme(context).headlineSmall?.copyWith(
                      color: const Color(0xff696969),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill the information to login account!',
                  style: textTheme(context).bodyLarge?.copyWith(
                      fontSize: 16,
                      color: const Color(0xff696969),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height * 0.06),
                CustomTextFormField(
                  controller: _userName,
                  hint: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      Validation.fieldValidation(value, "username"),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validation.emailValidation(value),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscureText: obscure,
                      validator: (value) =>
                          Validation.passwordValidation(value),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureText.value = !_obscureText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureConfirmText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _confirmPasswordController,
                      hint: 'Confirmed password',
                      obscureText: obscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the confirm password";
                        }
                        if (value != _passwordController.text) {
                          return "Password and Confirm Password do not match";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureConfirmText.value =
                              !_obscureConfirmText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, loading, child) {
                    return CustomButton(
                      btnText: "Sign Up",
                      isLoading: loading, // ✅ isLoading ka state manage hoga
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          isLoading.value = true;

                          isLoading.value = false;

                          // ✅ Navigate only if user created successfully
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Don’t have an Account?'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRoute.loginPage);
                            },
                          text: 'Sign In',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff7D3BF5),
                              color: Color(0xff7D3BF5)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      desktopLayout: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFFF8F3EE), // Background color
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  'Let’s Sign Up.!',
                  style: textTheme(context).headlineSmall?.copyWith(
                      color: const Color(0xff696969),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill the information to login account!',
                  style: textTheme(context).bodyLarge?.copyWith(
                      fontSize: 16,
                      color: const Color(0xff696969),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height * 0.06),
                CustomTextFormField(
                  controller: _userName,
                  hint: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      Validation.fieldValidation(value, "username"),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validation.emailValidation(value),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscureText: obscure,
                      validator: (value) =>
                          Validation.passwordValidation(value),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureText.value = !_obscureText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureConfirmText,
                  builder: (context, obscure, child) {
                    return CustomTextFormField(
                      controller: _confirmPasswordController,
                      hint: 'Confirmed password',
                      obscureText: obscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the confirm password";
                        }
                        if (value != _passwordController.text) {
                          return "Password and Confirm Password do not match";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureConfirmText.value =
                              !_obscureConfirmText.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, loading, child) {
                    return CustomButton(
                      btnText: "Sign Up",
                      isLoading: loading, // ✅ isLoading ka state manage hoga
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          isLoading.value = true;

                          isLoading.value = false;

                          // ✅ Navigate only if user created successfully
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Don’t have an Account?'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRoute.loginPage);
                            },
                          text: 'Sign In',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff7D3BF5),
                              color: Color(0xff7D3BF5)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
