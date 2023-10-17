import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/res/components/round_button.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/utils.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextFormField = TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _passTextFormField = TextEditingController(text: "cityslicka");
  final ValueNotifier<bool> _obscureNotifier = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    _emailTextFormField.dispose();
    _passTextFormField.dispose();
    _obscureNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailTextFormField,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obscureNotifier,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passTextFormField,
                    obscureText: _obscureNotifier.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscureNotifier.value = !_obscureNotifier.value;
                          },
                          child: Icon(_obscureNotifier.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                        )),
                  );
                }),
            SizedBox(
              height: 0.05 * height,
            ),
            RoundButton(
                title: "Login",
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailTextFormField.text.isEmpty) {
                    Utils.flushErrorBarMessage(
                        "Please enter your email", context);
                  } else if (_passTextFormField.text.isEmpty) {
                    Utils.flushErrorBarMessage(
                        "Please enter your password", context);
                  } else if (_passTextFormField.text.length < 6) {
                    Utils.flushErrorBarMessage(
                        "Please enter longer password", context);
                  } else {
                    Map data = {
                      'email': _emailTextFormField.text.toString(),
                      'password': _passTextFormField.text.toString()
                    };
                    authViewModel.loginApi(data, context);
                  }
                }),
            SizedBox(
              height: 0.03 * height,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RoutesName.signUp);
                },
                child: Text("Don't have and account? SignUp here!")),
          ],
        ),
      ),
    );
  }
}
