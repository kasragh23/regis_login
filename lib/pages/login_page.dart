import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visible = true;
  bool isChecked = false;

  final ButtonStyle style = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
        elevation: 0,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 18, color: Colors.white)
  );

  final TextStyle regularStyle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account Login', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 32),
              Text('Username', style: regularStyle),
              const SizedBox(height: 6),
              _userField(),
              const SizedBox(height: 16),
              Text('Password', style: regularStyle),
              const SizedBox(height: 6),
              _passField(),
              const SizedBox(height: 16),
              _row(),
              const SizedBox(height: 40),
              _button(),
            ],
          ),
        )
    ),
  );


  Widget _row(){
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) => setState(() => isChecked = value!),
          activeColor: Colors.white,
          checkColor: Colors.green,
        ),
        const Text('remember me', style: TextStyle(fontSize: 14)),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _userField() => TextFormField(
    controller: _userController,
    validator: _userValidator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      border: OutlineInputBorder(),
    ),
  );

  Widget _passField() => TextFormField(
    controller: _passController,
    validator: _passValidator,
    obscureText: visible,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      suffixIcon: InkWell(
        onTap: () => setState(() => visible = !visible),
        child: (visible)
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
      ),
    ),
  );

  Widget _button() {
    return ElevatedButton(
        onPressed: _submit,
        style: style,
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Login',
            )));
  }

  String? _userValidator(value) {
    if (value == null || value.isEmpty) return 'username is required';
    if (value.length < 6) return 'username must be longer than 6 characters';
    return null;
  }

  String? _passValidator(value) {
    if (value == null || value.isEmpty) return 'password is required';
    if (value.length < 8) return 'password must be longer than 8 characters';
    return null;
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _userController.clear();
      _passController.clear();
    }
  }
}