import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // UI State variables
  bool _isLoading = false;
  bool _obscureText = true;

  // COMPLETE LIST: Authorized users (Email : Password)
  final Map<String, String> _authorizedUsers = {
    'asadalimcj@gmail.com': 'asad8500',
    'archsamia36161@gmail.com': 'samia1234',
    'g202426980@kfupm.edu.sa': 'zeeshan1234',
    'sidraidrees444@gmail.com': 'sidra1234',
    'g202427260@kfupm.edu.sa': 'sally1234',
    'engsalyabdou@gmail.com': 'sallyabdou',
    'mohammed.mohammed@kfupm.edu.sa': 'moh1234',
    'ibudaiwi@kfupm.edu.sa': 'ibu9988',
    'osama.mohsen@kfupm.edu.sa': 'osa7766',
    'khwaja.mazher@kfupm.edu.sa': 'khw5544',
    'asifm@kfupm.edu.sa': 'asi3322',
    'awsan.mohammed@kfupm.edu.sa': 'aws1100',
    'abdullah.alsuhaibani@kfupm.edu.sa': 'abd2299',
    'mohamed.ahmed.1@kfupm.edu.sa': 'mah4488',
    'mohammed.qannan@kfupm.edu.sa': 'mqan6677',
    'ibrahim.wuni@kfupm.edu.sa': 'ibrahim',
  };

  // Placeholder Logo URL
  // final String _logoUrl = "https://cdn-icons-png.flaticon.com/512/2231/2231647.png";
  final String _logoUrl = "https://res.cloudinary.com/dm8kxucdf/image/upload/v1765573539/gbzu0svvp0bmysgr3f8d.png";

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate network delay for effect (makes it feel like a real app)
      await Future.delayed(const Duration(milliseconds: 800));

      final String inputEmail = _emailController.text.trim();
      final String inputPass = _passController.text;

      // Check if email exists in our list AND if password matches
      if (_authorizedUsers.containsKey(inputEmail) &&
          _authorizedUsers[inputEmail] == inputPass) {
        if (!mounted) return;

        // Navigate to Dashboard and PASS THE EMAIL
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(userEmail: inputEmail),
          ),
        );
      } else {
        // Login Failed
        setState(() => _isLoading = false);
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Invalid Email or Password"),
            backgroundColor: Colors.red[700],
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Logo Section
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(_logoUrl, fit: BoxFit.contain),
                ),
                const SizedBox(height: 24),

                // 2. Title Section
                Text(
                  "PCM Advisor",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                const Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // 3. Email Input
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter email';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 4. Password Input
                TextFormField(
                  controller: _passController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter password';
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // 5. Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
