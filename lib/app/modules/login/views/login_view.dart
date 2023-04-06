import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/button/primary_button.dart';
import '../../../components/input/generic_text_input.dart';
import '../../../components/input/generic_text_input_with_obscure.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Form(
            key: controller.formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05,),
                  _buildTextInputHint("Username"),
                  GenericTextInput(
                    controller: controller.emailController,
                    inputType: TextInputType.text,
                    maxLines: 1,
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 18,
                    ),
                  ),
                  _buildTextInputHint("Password"),
                  GenericTextInputWithObscure(
                    controller: controller.passwordController,
                    inputType: TextInputType.text,
                    maxLines: 1,
                    prefixIcon: const Icon(
                      Icons.key,
                      size: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: PrimaryButton(
                        isEnabled: true,
                        width: double.infinity,
                        onPressed: controller.handleLogin,
                        text: 'Masuk'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputHint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
