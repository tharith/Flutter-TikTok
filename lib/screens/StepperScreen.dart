import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;
  bool _isVerticalStepper = true;

  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep +=1) : null;
  }

  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stepper"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Vertical Stepper?"),
            subtitle: const Text("vertical/horizontal direction"),
            value: _isVerticalStepper,
            onChanged: (_) {
              setState(() {
                _isVerticalStepper = !_isVerticalStepper;
              });
            },
          ),
          const Divider(
            thickness: 2,
            height: 30,
          ),
          Expanded(
            child: Stepper(
              type: _isVerticalStepper
                      ? StepperType.vertical
                      : StepperType.horizontal,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => _stepTapped(step),
              onStepContinue: _stepContinue,
              onStepCancel: _stepCancel,
              steps: [
                Step(
                  title: const Text("Name", style: TextStyle(fontWeight: FontWeight.w900),),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Input your name"
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled
                ),
                // the second step: Phone
                Step(
                  title: const Text("Phone", style: TextStyle(fontWeight: FontWeight.w900),),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Input your phone"
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                        ? StepState.complete
                      : StepState.disabled,
                ),
                // the third step: Verify phone number
                Step(
                  title: const Text("Verify", style: TextStyle(fontWeight: FontWeight.w900),),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Verification code"
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
