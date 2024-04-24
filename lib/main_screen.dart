import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

    return  Scaffold(
        // FULLSCREEN BACKGROUND IMAGE
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/bg_startscreen.png"),
          fit: BoxFit.fill,
        ),
      ),
      // SCROLLABLE SCREEN
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // STACK
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.network("https://picsum.photos/200"),
                  const Positioned(
                    child: Text(
                      "Ciao",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    child: Text(
                      "Angel",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              // CHIP
              const Row(
                children: [
                  Chip(label: Text("Hallo")),
                  Chip(label: Text("Hallo")),
                ],
              ),
              const SizedBox(height: 32),
              // CHOICE CHIP
              Row(
                children: [
                  ChoiceChip(
                      showCheckmark: false,
                      label: const Text("Hallo"),
                      selected: true,
                      onSelected: (_) {}),
                  ChoiceChip(
                      label: const Text("Hallo"),
                      selected: false,
                      onSelected: (_) {}),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              // SEGMENTED BUTTON
              SegmentedButton<String>(
                segments: const <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: "Light",
                    label: Text('Light'),
                  ),
                  ButtonSegment<String>(
                    value: "Dark",
                    label: Text('Dark'),
                  ),
                  ButtonSegment<String>(
                    value: "System",
                    label: Text('System'),
                  ),
                ],
                selected: const <String>{"System"},
                onSelectionChanged: (Set<String> newSelection) {},
              ),
              // DIVIDER
              const Divider(),
              // HORIZONTAL LISTVIEW
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Chip(label: Text('Chip ${numbers[i]}'));
                  },
                ),
              ),

              const Divider(
                height: 60,
                indent: 30,
                endIndent: 30,
              ),
              // BOTTOM SHEET
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Bottom sheet'),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close bottom sheet'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Open"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}