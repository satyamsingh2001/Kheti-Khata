import 'package:flutter/material.dart';

class SSSSSSS extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onSelect;

  const SSSSSSS({
    Key? key,
    required this.index,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onSelect(index);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.white,
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: Colors.blue,
                  ),
                  title: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.blue,
                  )
                      : Icon(
                    Icons.circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class RadioOptionsScreen extends StatefulWidget {
  @override
  _RadioOptionsScreenState createState() => _RadioOptionsScreenState();
}

class _RadioOptionsScreenState extends State<RadioOptionsScreen> {
  int _selectedOption = -1; // Initialize with no selection

  void _handleOptionSelected(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Options'),
      ),
      body: Column(
        children: [
          SSSSSSS(
            index: 0,
            text: 'Option 1',
            icon: Icons.check,
            isSelected: _selectedOption == 0,
            onSelect: _handleOptionSelected,
          ),
          SSSSSSS(
            index: 1,
            text: 'Option 2',
            icon: Icons.check,
            isSelected: _selectedOption == 1,
            onSelect: _handleOptionSelected,
          ),
          // Add more CustomRadio widgets for additional options
        ],
      ),
    );
  }
}

