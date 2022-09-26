import 'package:flutter/material.dart';
import 'package:todo_app_ui_ii_example/widget/app_drawer.dart';

class Date extends StatelessWidget {
  static const String routeName = '/date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Ngày Tháng'),
      backgroundColor: Colors.green,),
      drawer: AppDrawer(),
      backgroundColor: Colors.greenAccent,
      body: DatePickerDemo(),
    );
  }
}
class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  /// Which holds the selected date
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Chọn ngày',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
