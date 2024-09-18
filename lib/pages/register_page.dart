import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.cyan,
      elevation: 0,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 18, color: Colors.white));

  final TextStyle regularStyle =
  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  String? selected;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('User Registraition Form',
                    style: TextStyle(fontSize: 28)),
                const SizedBox(height: 20),
                Text('First Name:', style: regularStyle),
                _firstnameField(),
                const SizedBox(height: 20),
                Text('Last Name:', style: regularStyle),
                _lastnameField(),
                const SizedBox(height: 20),
                Text('E-Mail:', style: regularStyle),
                _emailField(),
                const SizedBox(height: 20),
                Text('Username:', style: regularStyle),
                _usernameField(),
                const SizedBox(height: 20),
                Text('Password:', style: regularStyle),
                _passwordField(),
                const SizedBox(height: 20),
                Text('Gender:', style: regularStyle),
                const SizedBox(height: 12),
                _row(),
                _genderValidate(),
                const SizedBox(height: 12),
                Center(child: _button()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderValidate() {
    return (isSelected)
        ? const Text(
      'please choose one gender!',
      style: TextStyle(fontSize: 12, color: Colors.red),
    )
        : const SizedBox();
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: _submit,
      style: style,
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'SEND',
        ),
      ),
    );
  }

  Widget _row() {
    return Row(
      children: [
        Radio<String>(
            value: 'Male',
            groupValue: selected,
            onChanged: (value) => setState(() {
              isSelected = false;
              selected = value;
            })),
        Text('Male', style: regularStyle),
        const Spacer(),
        Radio<String>(
            value: 'Female',
            groupValue: selected,
            onChanged: (value) => setState(() {
              isSelected = false;
              selected = value;
            })),
        Text('Female', style: regularStyle),
        const Spacer(),
      ],
    );
  }

  Widget _firstnameField() => TextFormField(
    controller: _fnameController,
    validator: _validator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );

  Widget _lastnameField() => TextFormField(
    controller: _lnameController,
    validator: _validator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );

  Widget _emailField() => TextFormField(
    controller: _emailController,
    validator: _validator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );

  Widget _usernameField() => TextFormField(
    controller: _userController,
    validator: _validator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );

  Widget _passwordField() => TextFormField(
    controller: _passController,
    validator: _validator,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );
  String? _validator(value) {
    if (value == null || value.isEmpty) return 'is required';
    return null;
  }

  void _submit() {
    if ((_formkey.currentState?.validate() ?? false) && (selected != null)) {
      _fnameController.clear();
      _lnameController.clear();
      _emailController.clear();
      _userController.clear();
    }
  }
}