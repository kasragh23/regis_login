import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  bool _toggle = false;

  final List<DropdownMenuItem> items = [
    const DropdownMenuItem(
      value: '1',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('1'), Icon(Icons.one_k)],
      ),
    ),
    const DropdownMenuItem(
      value: '2',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('2'), Icon(Icons.two_k)],
      ),
    ),
    const DropdownMenuItem(
      value: '3',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('3'), Icon(Icons.three_k)],
      ),
    ),
    const DropdownMenuItem(
      value: '4',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('4'), Icon(Icons.four_k)],
      ),
    )
  ];
  String? _item;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Switch(
                  value: _toggle,
                  onChanged: (value) => setState(() => _toggle = value)),

              const SizedBox(height: 20),

              ElevatedButton(

                onPressed: (_toggle) ? () {} : null,
                child:(_toggle) ? const Text('Enabled') : const Text('Disabled'),
              ),

              const SizedBox(height: 20),

              DropdownButton(
                  items: items,
                  value: _item,
                  onChanged: (value) => setState(() => _item = value),
                  dropdownColor: const Color.fromARGB(400, 200, 240, 80),
                  borderRadius: BorderRadius.circular(10),
                  iconSize: 12,
                  alignment: Alignment.center,
                  elevation: 0,
                  hint: const Text('Select an item'),
                  icon: const Icon(Icons.arrow_downward))
            ],
          ),
        ),
      );
}
