import 'package:calculater/Second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  final day1 = TextEditingController();
  final month1 = TextEditingController();
  final year1 = TextEditingController();
  var day, month, year;
  String week = "";
  clearTextInput() {
    day1.clear();
    month1.clear();
    year1.clear();
  }

  getResult(int date, int month, int year) {
    int mcode = 0;
    if (((month == 1 ||
                month == 3 ||
                month == 5 ||
                month == 7 ||
                month == 8 ||
                month == 10 ||
                month == 12) &&
            (1 <= day || day <= 31) &&
            (year >= 1600)) ||
        (month == 4 || month == 6 || month == 9 || month == 11) &&
            (1 <= day || day <= 30) &&
            (year >= 1600) ||
        ((month == 2 && year % 4 == 0 && (1 <= day || day <= 29)) ||
            (month == 2 && year % 4 != 0 && (1 <= day || day <= 28)))) {
      if (month == 2 || month == 3 || month == 11) {
        mcode += 3;
      } else if (month == 4 || month == 7) {
        mcode += 6;
      } else if (month == 9 || month == 12) {
        mcode += 5;
      } else if (month == 1 || month == 10) {
        mcode += 0;
      } else if (month == 6) {
        mcode += 4;
      } else if (month == 5) {
        mcode += 1;
      } else if (month == 8) {
        mcode += 2;
      } else {
        this.week = "enter correct month no";
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Second(
                    day: day,
                    month: month,
                    year: year,
                    week: "please enter correct month no")));
      }
      int ycode = 0;
      int yd = year ~/ 100;
      int ya = yd % 4;

      switch (ya) {
        case 0:
          ycode += 6;
          break;
        case 1:
          ycode += 4;
          break;
        case 2:
          ycode += 2;
          break;
        case 3:
          ycode += 0;
          break;
      }
      int ydigts = year % 100;
      int yda = (ydigts ~/ 4);
      int leap = year % 4;
      int week = day + mcode + ydigts + yda + ycode;
      int dod = week % 7;

      if (leap == 0 && (month == 1 || month == 2)) {
        if (dod == 0) dod = 7;
        dod -= 1;
      }
      switch (dod) {
        case 0:
          this.week = "Sunday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Sunday")));
          break;
        case 1:
          this.week = "Monday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Monday")));
          break;
        case 2:
          this.week = "Tuesday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Tuesday")));
          break;
        case 3:
          this.week = "Wednesday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Wednesday")));
          break;
        case 4:
          this.week = "Thursday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Thursday")));
          break;
        case 5:
          this.week = "Friday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Friday")));
          break;
        case 6:
          this.week = "Saturday";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day, month: month, year: year, week: "Saturday")));
          break;
        default:
          this.week = "Enter Valid Date";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Second(
                      day: day,
                      month: month,
                      year: year,
                      week: "Please Enter Valid Date")));
          break;
      }
    } else {
      this.week = "Enter Valid Date";
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Second(
                  day: day,
                  month: month,
                  year: year,
                  week: "Please Enter Valid Date")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Week Calculater", style: TextStyle(color: Colors.orange)),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text("Enter Day:"),
                    SizedBox(
                      width: 30.0,
                    ),
                    Expanded(
                      child: TextField(
                          textAlign: TextAlign.center,
                          controller: day1,
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            day = int.parse(value);
                          }),
                    ),
                  ],
                )),
            SizedBox(
              width: 10.0,
            ),
            Container(
                alignment: Alignment.center,
                child: Row(children: [
                  Text("Enter Month:"),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: TextField(
                        textAlign: TextAlign.center,
                        controller: month1,
                        autocorrect: true,
                        autofocus: false,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          month = int.parse(value);
                        }),
                  )
                ])),
            SizedBox(
              width: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(children: [
                Text("Enter Year:"),
                SizedBox(
                  width: 30.0,
                ),
                Expanded(
                  child: TextField(
                      textAlign: TextAlign.center,
                      controller: year1,
                      autocorrect: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        year = int.parse(value);
                      }),
                ),
              ]),
            ),
            SizedBox(
              width: 10.0,
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: ElevatedButton(
                          child: Text(
                            "Sumbmit",
                            style: TextStyle(color: Colors.lime),
                          ),
                          onPressed: () {
                            getResult(day, month, year);
                            clearTextInput();
                          }),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Clear",
                          style: TextStyle(color: Colors.lime),
                        ),
                        onPressed: clearTextInput,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
