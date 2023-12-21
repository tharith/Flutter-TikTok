import 'package:flutter/material.dart';

class StrengthPassword extends StatefulWidget {
  const StrengthPassword({super.key});

  @override
  State<StrengthPassword> createState() => _StrengthPasswordState();
}

enum Strength {
  empty("", 0/4, Colors.transparent),
  weak("weak", 1/4, Colors.red),
  medium("medium", 2/4, Colors.yellow),
  strong("strong", 3/4, Colors.blue),
  veryStrong("Very strong", 4/4, Colors.green);

  final String text;
  final double value;
  final Color color;

  const Strength(this.text, this.value, this.color);
}

class _StrengthPasswordState extends State<StrengthPassword> {
  Strength _strength = Strength.empty;

  Strength _calulatePasswordStrength(String value) {
    if (value.isEmpty) {
      return Strength.empty;
    } else if (value.length < 6) {
      return Strength.weak;
    } else if (value.length < 10) {
      return Strength.medium;
    } else {
      final containsRecommendedChars = value.contains(RegExp(r'[A-Z]'))
                && value.contains(RegExp(r'[a-z]'))
                && value.contains(RegExp(r'[0-9]'))
                && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      if (!containsRecommendedChars) {
        return Strength.strong;
      } else {
        return Strength.veryStrong;
      }
    }
  }

  void _updatePasswordStrength(String value) {
    setState(() {
      _strength = _calulatePasswordStrength(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Strength Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _updatePasswordStrength(value),
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password"
              ),
            ),
            const SizedBox(height: 10,),
            LinearProgressIndicator(
              minHeight: 10,
              value: _strength.value,
              backgroundColor: Colors.grey,
              color: _strength.color,
            ),
            const SizedBox(height: 10,),
            Text(
              _strength.text.isNotEmpty ? "Your password is ${_strength.text}" : ''
            )
          ],
        ),
      ),
    );
  }
}
