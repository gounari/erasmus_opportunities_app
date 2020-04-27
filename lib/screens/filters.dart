import 'package:erasmusopportunitiesapp/helpers/accessibility.dart';
import 'package:erasmusopportunitiesapp/helpers/countries.dart';
import 'package:erasmusopportunitiesapp/helpers/filter_constants.dart';
import 'package:erasmusopportunitiesapp/helpers/topics.dart';
import 'package:erasmusopportunitiesapp/models/Filters.dart';
import 'package:erasmusopportunitiesapp/widgets/multiselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';

class FiltersScreen extends StatefulWidget {

  final Filters filters;

  const FiltersScreen({Key key, this.filters}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  static final filterConstants = FilterConstants();

  var _durationRange = RangeValues(1, 90);
  var _durationStart = '0';
  var _durationEnd = '90';
  _resetDuration() {
    _durationRange = RangeValues(1, 90);
    _durationStart = _durationRange.start.floor().toString();
    _durationEnd = _durationRange.end.floor().toString();
  }

  var _ageRange = RangeValues(12, 120);
  var _ageStart = '12';
  var _ageEnd = '120';
  _resetAge() {
    _ageRange = RangeValues(12, 120);
    _ageStart = _ageRange.start.floor().toString();
    _ageEnd = _ageRange.end.floor().toString();
  }


  var _feesRange = RangeValues(0, 500);
  var _feesStart = '0';
  var _feesEnd = '500';
  _resetFees() {
    _feesRange = RangeValues(0, 500);
    _feesStart = _feesRange.start.floor().toString();
    _feesEnd = _feesRange.end.floor().toString();
  }

  var _expensesRange = RangeValues(0, 500);
  var _expensesStart = '0';
  var _expensesEnd = '500';
  _resetExpenses() {
    _expensesRange = RangeValues(0, 500);
    _expensesStart = _expensesRange.start.floor().toString();
    _expensesEnd = _expensesRange.end.floor().toString();
  }

  var _dateRangeLabelText = 'Tap to select dates';

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
                              child: Text(
                                "Start Date",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: "start_date",
                          ),
                          FormBuilderFieldOption(
                              child: Text(
                                  "Deadline",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: "deadline"
                          ),
                          FormBuilderFieldOption(
                              child: Text("Date Added",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: "date_added"
                          ),
                        ],

                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Date range",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderDateRangePicker(
                        attribute: 'date_range',
                        initialValue: [],
                        decoration: InputDecoration(
                          labelText:  _dateRangeLabelText,
                          border: InputBorder.none,
                        ),
                        format: DateFormat("dd/MM/yyyy"),
                        lastDate: DateTime.utc(2023),
                        firstDate: DateTime.now(),
                        onChanged: (dates) {
                          setState(() {
                            if (dates.toString().isEmpty) {
                              _dateRangeLabelText = 'Tap to select dates';
                            } else {
                              _dateRangeLabelText = '';
                            }
                          });
                        },
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

                      SizedBox(height: 30.0,),

                      Text(
                        "Venue Location",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "venue_location",
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
                                padding: EdgeInsets.only(top: 20.0),
                                child: MultiSelect(
                                    autovalidate: false,
                                    dataSource: countries,
                                    textField: 'name',
                                    valueField: 'name',
                                    filterable: true,
                                    required: false,
                                    value: null,
                                    onSaved: (value) {
                                     //
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Participating Countries",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "participating_countries",
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
                                padding: EdgeInsets.only(top: 20.0),
                                child: MultiSelect(
                                    autovalidate: false,
                                    dataSource: countries,
                                    textField: 'name',
                                    valueField: 'name',
                                    hintText: 'Tap to select countries',
                                    filterable: true,
                                    required: false,
                                    value: null,
                                    onSaved: (value) {
                                      //print('The value is $value');
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Ages Accepted",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '$_ageStart to $_ageEnd years old',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "ages_accepted",
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
                                  min: 12,
                                  max: 120,
                                  activeColor: Theme.of(context).primaryColor,
                                  labels: RangeLabels('$_ageStart', '$_ageEnd'),
                                  values: _ageRange,
                                  divisions: 108,
                                  onChanged: (RangeValues value) {
                                    setState(() {
                                      _ageRange = value;
                                      _ageStart = value.start.floor().toString();
                                      _ageEnd = value.end.floor().toString();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Topics",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "topics",
                        formField: FormField(
                          enabled: true,
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText: field.errorText,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: MultiSelect(
                                    autovalidate: false,
                                    dataSource: topics,
                                    textField: 'topic',
                                    valueField: 'topic',
                                    hintText: 'Tap to select topics',
                                    filterable: true,
                                    required: false,
                                    value: null,
                                    onSaved: (value) {
                                      //print('The value is $value');
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Non Refundable Fees",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '£$_feesStart to £$_feesEnd',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "fees",
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
                                  min: 0,
                                  max: 500,
                                  activeColor: Theme.of(context).primaryColor,
                                  labels: RangeLabels('£$_feesStart', '£$_feesEnd'),
                                  values: _feesRange,
                                  divisions: 20,
                                  onChanged: (RangeValues value) {
                                    setState(() {
                                      _feesRange = value;
                                      _feesStart = value.start.floor().toString();
                                      _feesEnd = value.end.floor().toString();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Reimbursable Expenses Amount",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '£$_expensesStart to £$_expensesEnd',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: "expenses",
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
                                  min: 0,
                                  max: 500,
                                  activeColor: Theme.of(context).primaryColor,
                                  labels: RangeLabels('£$_expensesStart', '£$_expensesEnd'),
                                  values: _expensesRange,
                                  divisions: 20,
                                  onChanged: (RangeValues value) {
                                    setState(() {
                                      _expensesRange = value;
                                      _expensesStart = value.start.floor().toString();
                                      _expensesEnd = value.end.floor().toString();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Organisations that provide",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),


                      FormBuilderCustomField(
                        attribute: "accessibility",
                        formField: FormField(
                          enabled: true,
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText: field.errorText,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child:
                                FormBuilderCheckboxList(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  activeColor: Theme.of(context).primaryColor,
                                  attribute: "accessibility",
                                  options: accessibility,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

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
                      _resetAge();
                      _resetDuration();
                      _resetExpenses();
                      _resetFees();
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
                      Navigator.pop(context, widget.filters);

                      try {
                        if (_fbKey.currentState.saveAndValidate()) {
                          FormBuilderState currentState = _fbKey.currentState;

//                          await DatabaseService(uid: user.uid)
//                              .updateOpportunity(
//                            currentState.value[opportunity.title],
//                            currentState.value[opportunity.venueLocation],
//                            currentState.value[opportunity.type],
//                            currentState.value[opportunity.startDate],
//                            currentState.value[opportunity.endDate],
//                            currentState.value[opportunity.lowAge],
//                            currentState.value[opportunity.highAge],
//                            currentState.value[opportunity.topic],
//                            currentState.value[opportunity.applicationDeadline],
//                            currentState.value[opportunity.participationCost],
//                            currentState.value[opportunity.reimbursementLimit],
//                            currentState.value[opportunity.applicationLink],
//                            currentState.value[opportunity.provideForDisabilities],
//                            currentState.value[opportunity.description],
//                          );

                          currentState.reset();
                          final snackBar = SnackBar(
                            content: Text('Opportunity succesfully published!'),
                            backgroundColor: Colors.green,
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        }

                      } catch (error) {
                        print(error.toString());
                        final snackBar = SnackBar(
                          content: Text('An error accured! Please try again.'),
                          backgroundColor: Colors.red,
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                        return null;
                      }
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
