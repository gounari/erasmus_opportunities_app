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

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(Colors.black);

    var filters = widget.filters;

    // Sort by
    String _getSortByInitialValue() {
      if (widget.filters.sortByStartDate) return filterConstants.startDate;
      if (widget.filters.sortByDeadline) return filterConstants.deadline;
      if (widget.filters.sortByDateAdded) return filterConstants.dateAdded;
    }
    _setSortBy(value) {
      if (value == filterConstants.startDate) {
        filters.sortByStartDate = true;
        filters.sortByDeadline = false;
        filters.sortByDateAdded = false;
      } else if (value == filterConstants.deadline) {
        filters.sortByStartDate = false;
        filters.sortByDeadline = true;
        filters.sortByDateAdded = false;
      } else {
        filters.sortByStartDate = false;
        filters.sortByDeadline = false;
        filters.sortByDateAdded = true;
      }
    }

    // Date range
    var dateRangeList = filters.dateRangeList;
    var _dateRangeLabelText = dateRangeList != null && filters.dateRangeList.isNotEmpty? '' : 'Tap to select dates';
    _setDateRange(value) {
      filters.dateRange = true;
      filters.dateRangeList = value;
    }

    // Duration
    var _durationRange = filters.durationList;
    var _durationStart = _durationRange.start.floor().toString();
    var _durationEnd = _durationRange.end.floor().toString();
    var _durationRangeText = '$_durationStart to $_durationEnd days';
    _setDuration(RangeValues value) {
      setState(() {
        if (value != filters.getDefaultDuration()) filters.duration = true;
        filters.durationList = value;
      });
    }

    // Venue location
    var _venueLocationList = filters.venueLocationList;
    _setVenueLocation(List value) {
      setState(() {
        if (value.isNotEmpty) filters.venueLocation = true;
        filters.venueLocationList = [];
        for (var location in value) {
          filters.venueLocationList.add(location.toString());
        }
      });
    }

    // Participating countries
    var _participatingCountriesList = filters.participatingCountriesList;
    _setParticipatingCountries(List value) {
      setState(() {
        if (value.isNotEmpty) filters.participatingCountries = true;
        filters.participatingCountriesList = [];
        for (var location in value) {
          filters.participatingCountriesList.add(location.toString());
        }
      });
    }

    // Ages accepted
    var _ageRange = filters.agesAcceptedList;
    var _ageStart = _ageRange.start.floor().toString();
    var _ageEnd = _ageRange.end.floor().toString();
    var _ageText = '$_ageStart to $_ageEnd years old';
    _setAge(RangeValues value) {
      setState(() {
        if (value != filters.getDefaultAgesAccepted()) filters.agesAccepted = true;
        filters.agesAcceptedList = value;
      });
    }

    // Topics
    var _topicsList = filters.topicsList;
    _setTopics(List value) {
      setState(() {
        if (value.isNotEmpty) filters.topics = true;
        filters.topicsList = [];
        for (var location in value) {
          filters.topicsList.add(location.toString());
        }
      });
    }

    // Non refundable fees
    var _feesRange = filters.nonRefundableFeesList;
    var _feesStart = _feesRange.start.floor().toString();
    var _feesEnd = _feesRange.end.floor().toString();
    var _feesText = '£$_feesStart to £$_feesEnd';
    _setFees(RangeValues value) {
      setState(() {
        if (value != filters.getDefaultNonRefundableFees()) filters.nonRefundableFees = true;
        filters.nonRefundableFeesList = value;
      });
    }

    // Reimbursable expenses amount
    var _expensesRange = filters.reimbursableExpensesList;
    var _expensesStart = _expensesRange.start.floor().toString();
    var _expensesEnd = _expensesRange.end.floor().toString();
    var _expensesText = '£$_expensesStart to £$_expensesEnd';
    _setExpenses(RangeValues value) {
      setState(() {
        if (value != filters.getDefaultReimbursableExpenses()) filters.reimbursableExpenses = true;
        filters.reimbursableExpensesList = value;
      });
    }

    _onReset() {
      setState(() {
        filters.onReset();
      });
      _fbKey.currentState.reset();
    }


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
                        attribute: filterConstants.sortBy,
                        initialValue: _getSortByInitialValue(),
                        activeColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onSaved: (value) {
                          _setSortBy(value);
                        },
                        options: <FormBuilderFieldOption>[
                          FormBuilderFieldOption(
                              child: Text(
                                "Start Date",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: filterConstants.startDate,
                          ),
                          FormBuilderFieldOption(
                              child: Text(
                                  "Deadline",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: filterConstants.deadline
                          ),
                          FormBuilderFieldOption(
                              child: Text("Date Added",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              value: filterConstants.dateAdded
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
                        attribute: filterConstants.dateRange,
                        initialValue: filters.dateRangeList,
                        decoration: InputDecoration(
                          labelText:  _dateRangeLabelText,
                          border: InputBorder.none,
                        ),
                        onSaved: (value) {
                          _setDateRange(value);
                        },
                        format: DateFormat("dd/MM/yyyy"),
                        lastDate: DateTime.utc(2023),
                        firstDate: DateTime.now(),
                        onChanged: (dates) {
                          setState(() {
                            if (dates.toString().isEmpty) {
                              filters.dateRangeList = [];
                              _dateRangeLabelText = 'Tap to select dates';
                            } else {
                              filters.dateRangeList = [DateTime.now()];
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
                        _durationRangeText,
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: filterConstants.duration,
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
                                    _setDuration(value);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Venue location",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: filterConstants.venueLocation,
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
                                    initialValue: _venueLocationList,
                                    required: false,
                                    onSaved: (value) {
                                      _setVenueLocation(value);
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Participating countries",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: filterConstants.participatingCountries,
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
                                    initialValue: _participatingCountriesList,
                                    onSaved: (value) {
                                      _setParticipatingCountries(value);
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Ages accepted",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        _ageText,
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),

                      FormBuilderCustomField(
                        attribute: filterConstants.agesAccepted,
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
                                    _setAge(value);
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
                        attribute: filterConstants.topics,
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
                                    initialValue: _topicsList,
                                    onSaved: (value) {
                                      _setTopics(value);
                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Text(
                        "Non refundable fees",
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
                        attribute: filterConstants.nonRefundableFees,
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
                        "Reimbursable expenses amount",
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
                        attribute: filterConstants.reimbursableExpenses,
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
                        attribute: filterConstants.accessibility,
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
                                  attribute: filterConstants.accessibility,
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
                      _onReset();
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

                      if (_fbKey.currentState.saveAndValidate()) {
                        Navigator.pop(context, filters);
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
