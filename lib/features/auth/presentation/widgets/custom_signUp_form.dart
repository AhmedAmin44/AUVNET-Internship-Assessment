import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_state.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/widgets/custom_auth_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_string.dart';
import 'text_form_field.dart';

class CustomSignUpForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery used here to access screen height dynamically
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        } else if (state.user != null) {
          customNavigateReplacement(context, "/login");
        }
      },
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();

        return Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFField(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: AppStrings.emailAddress,
                onChanged: (value) => bloc.add(EmailChanged(value)),
              ),

              // Password
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

              // Confirm Password
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
                onChanged: (value) => bloc.add(ConfirmPasswordChanged(value)),
              ),

              SizedBox(height: screenHeight * 0.05), // MediaQuery used here

              // Submit button or loading
              state.isLoading
                  ? const CircularProgressIndicator()
                  : CustomLoginBotton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(SignUpSubmitted());
                        }
                      },
                      text: AppStrings.signUp,
                    ),

              SizedBox(height: 16.h), // ScreenUtil for spacing

              // Login Redirect
              TextButton(
                onPressed: () {
                  customNavigate(context, "/login");
                },
                child: Text(
                  AppStrings.createAccount,
                  style: CustomTextStyles.dmSansBoldstyle14.copyWith(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
