import 'package:auvnet_internship_assessment/core/functions/navigation.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_state.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/widgets/custom_auth_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_string.dart';
import 'text_form_field.dart';

class CustomSignInForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        } else if (state.user != null) {
          // Navigate to home screen if login is successful
          customNavigateReplacement(context, "/home");
        }
      },
      builder: (context, state) {
        // Access the AuthBloc instance
        final bloc = context.read<AuthBloc>();

        return Form(
          key: _formKey,
          child: Column(
            children: [
              // Email Field
              TextFField(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: AppStrings.emailAddress,
                onChanged: (value) => bloc.add(EmailChanged(value)),
              ),

              // Password Field
              TextFField(
                labelText: AppStrings.password,
                obscureText: state.isPasswordObscured,
                prefixIcon: IconButton(
                  icon: Icon(
                    state.isPasswordObscured
                        ? Icons.lock_outline
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => bloc.add(TogglePasswordVisibility()),
                ),
                onChanged: (value) => bloc.add(PasswordChanged(value)),
              ),

              SizedBox(height: screenHeight * 0.05), // MediaQuery usage

              // Login Button or Loader
              state.isLoading
                  ? const CircularProgressIndicator()
                  : CustomLoginBotton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(LoginSubmitted());
                        }
                      },
                      text: AppStrings.logIn,
                    ),

              SizedBox(height: 16.h),

              // Navigate to SignUp
              TextButton(
                onPressed: () => customNavigate(context, "/signUp"),
                child: Text(
                  AppStrings.createAccount,
                  style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
