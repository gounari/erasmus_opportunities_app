import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  var _durationRange = RangeValues(1, 90);
  var _durationStart = '0';
  var _durationEnd = '90';
  var _dateRangeLabelText = 'Anytime';

  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setNavigationBarColor(Colors.black);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 60),
              child: FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 30.0,),

                      Text(
                        "Sort by",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderRadio(
                        attribute: "favorite_ice_cream",
                        initialValue: "start_date",
                        activeColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        options: <FormBuilderFieldOption>[
                          FormBuilderFieldOption(
                              child: Text("Start Date"),
                              value: "start_date",
                          ),
                          FormBuilderFieldOption(
                              child: Text("Deadline"),
                              value: "deadline"
                          ),
                          FormBuilderFieldOption(
                              child: Text("Date Added"),
                              value: "date_added"
                          ),
                        ],

                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Dates range",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderDateRangePicker(
                        format: DateFormat("yyyy-MM-dd"),
                        lastDate: DateTime.utc(2023),
                        firstDate: DateTime.now(),
                        attribute: 'date_range',
                        onChanged: (dates) {
                          setState(() {
                            print('in');
                            _dateRangeLabelText = '';
                          });
                        },
                        decoration: InputDecoration(
                          labelText:  _dateRangeLabelText,
                          border: InputBorder.none,),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Duration",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '$_durationStart to $_durationEnd days',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "duration",
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        formField: FormField(
                          enabled: true,
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText: field.errorText,
                              ),
                              child: Container(
                                height: 100,
                                padding: EdgeInsets.only(top: 20.0),
                                child: RangeSlider(
                                  min: 1,
                                  max: 90,
                                  activeColor: Theme.of(context).primaryColor,
                                  labels: RangeLabels('$_durationStart days', '$_durationEnd days'),
                                  values: _durationRange,
                                  divisions: 90,
                                  onChanged: (RangeValues value) {
                                    setState(() {
                                      _durationRange = value;
                                      _durationStart = value.start.floor().toString();
                                      _durationEnd = value.end.floor().toString();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      FormBuilderDateTimePicker(
                        attribute: "date",
                        inputType: InputType.date,
                        decoration:
                        InputDecoration(labelText: "Appointment Time"),
                      ),
                      FormBuilderSlider(
                        attribute: "slider",
                        validators: [FormBuilderValidators.min(6)],
                        min: 0.0,
                        max: 10.0,
                        initialValue: 1.0,
                        divisions: 20,
                        decoration:
                        InputDecoration(labelText: "Number of things"),
                      ),
                      FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                            "I have read and agree to the terms and conditions"),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                            errorText:
                            "You must accept terms and conditions to continue",
                          ),
                        ],
                      ),
                      FormBuilderDropdown(
                        attribute: "gender",
                        decoration: InputDecoration(labelText: "Gender"),
                        // initialValue: 'Male',
                        hint: Text('Select Gender'),
                        validators: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text("$gender")
                        )).toList(),
                      ),
                      FormBuilderTextField(
                        attribute: "age",
                        decoration: InputDecoration(labelText: "Age"),
                        validators: [
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderSegmentedControl(
                        decoration:
                        InputDecoration(labelText: "Movie Rating (Archer)"),
                        attribute: "movie_rating",
                        options: List.generate(5, (i) => i + 1)
                            .map(
                                (number) => FormBuilderFieldOption(value: number))
                            .toList(),
                      ),
                      FormBuilderSwitch(
                        label: Text('I Accept the tems and conditions'),
                        attribute: "accept_terms_switch",
                        initialValue: true,
                      ),
                      FormBuilderTouchSpin(
                        decoration: InputDecoration(labelText: "Stepper"),
                        attribute: "stepper",
                        initialValue: 10,
                        step: 1,
                      ),
                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate this form"),
                        attribute: "rate",
                        iconSize: 32.0,
                        initialValue: 1,
                        max: 5,
                      ),
                      FormBuilderCheckboxList(
                        decoration:
                        InputDecoration(labelText: "The language of my people"),
                        attribute: "languages",
                        initialValue: ["Dart"],
                        options: [
                          FormBuilderFieldOption(value: "Dart"),
                          FormBuilderFieldOption(value: "Kotlin"),
                          FormBuilderFieldOption(value: "Java"),
                          FormBuilderFieldOption(value: "Swift"),
                          FormBuilderFieldOption(value: "Objective-C"),
                        ],
                      ),

                      FormBuilderFilterChip(
                        attribute: "pets",
                        options: [
                          FormBuilderFieldOption(
                              child: Text("Cats"),
                              value: "cats"
                          ),
                          FormBuilderFieldOption(
                              child: Text("Dogs"),
                              value: "dogs"
                          ),
                          FormBuilderFieldOption(
                              child: Text("Rodents"),
                              value: "rodents"
                          ),
                          FormBuilderFieldOption(
                              child: Text("Birds"),
                              value: "birds"
                          ),
                        ],
                      ),
                      FormBuilderSignaturePad(
                        decoration: InputDecoration(labelText: "Signature"),
                        attribute: "signature",
                        height: 100,
                      ),
                    ],
                  ),
                ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 57.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}

