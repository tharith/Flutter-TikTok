import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double _value = 0.0;
  void _handleValueChanged(double newValue) {
    setState(() {
      _value = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Filter Chip"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterChip(
                    label: const Text(
                      '\$0',
                      style: TextStyle(
                        fontFamily: "KantumruyProBold",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        fontSize: 20.0
                      ),
                    ),
                    selected: _value == 0.0,
                    onSelected: (isSelected) {
                      _handleValueChanged(0.0);
                    },
                    selectedColor: Colors.red,
                    labelStyle: const TextStyle(
                      color: Colors.white
                    ),
                    backgroundColor: Colors.blue,
                    checkmarkColor: Colors.white,
                  ),
                  FilterChip(
                    label: const Text(
                      '\$10',
                      style: TextStyle(
                          fontFamily: "KantumruyProBold",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          fontSize: 20.0
                      ),
                    ),
                    selected: _value == 10.0,
                    onSelected: (isSelected) {
                      _handleValueChanged(10.0);
                    },
                    selectedColor: Colors.red,
                    labelStyle: const TextStyle(
                      color: Colors.white
                    ),
                    backgroundColor: Colors.blue,
                    checkmarkColor: Colors.white,
                  ),
                  FilterChip(
                    label: const Text(
                      '\$20',
                      style: TextStyle(
                          fontFamily: "KantumruyProBold",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          fontSize: 20.0
                      ),
                    ),
                    selected: _value == 20.0,
                    onSelected: (isSelected) {
                      _handleValueChanged(20.0);
                    },
                    selectedColor: Colors.red,
                    labelStyle: const TextStyle(
                      color: Colors.white
                    ),
                    backgroundColor: Colors.blue,
                    checkmarkColor: Colors.white,
                  ),
                  FilterChip(
                    label: const Text(
                      '\$30',
                      style: TextStyle(
                          fontFamily: "KantumruyProBold",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          fontSize: 20.0
                      ),
                    ),
                    selected: _value == 30.0,
                    onSelected: (isSelected) {
                      _handleValueChanged(30.0);
                    },
                    selectedColor: Colors.red,
                    labelStyle: const TextStyle(
                      color: Colors.white
                    ),
                    backgroundColor: Colors.blue,
                    checkmarkColor: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: LinearProgressIndicator(
                value: _value / 30.0,
                color: Colors.red,
                backgroundColor: Colors.blue,
                minHeight: 10.0,
              ),
            ),
            Text(
              '\$$_value',
              style: TextStyle(
                // set default color when value = 0
                color: _value == 0 ? Colors.blue : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                letterSpacing: 2.5,
                fontStyle: FontStyle.italic,
                fontFamily: "KantumruyProBold"
              ),
            )
          ],
        ),
      ),
    );
  }
}
