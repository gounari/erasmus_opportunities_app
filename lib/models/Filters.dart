
import 'package:flutter/material.dart';

import 'opportunity.dart';

class Filters {
  bool title = false;
  String _titleValue = '';

  bool sortByStartDate = true;
  bool sortByDeadline = false;
  bool sortByDateAdded = false;

  bool liked = false;
  bool free = false;

  bool dateRange = false;
  List<DateTime> dateRangeList = [];
  bool duration = false;
  RangeValues durationList = RangeValues(1, 90);
  bool venueLocation = false;
  List<String> venueLocationList = [];
  bool participatingCountries = false;
  List<String> participatingCountriesList = [];
  bool agesAccepted = false;
  RangeValues agesAcceptedList = RangeValues(12, 120);
  bool topics = false;
  List<String> topicsList = [];
  bool nonRefundableFees = false;
  RangeValues nonRefundableFeesList = RangeValues(0, 500);
  bool reimbursableExpenses = false;
  RangeValues reimbursableExpensesList = RangeValues(0, 500);
  bool accessibility = false;
  List<String> accessibilityList = [];

  List<Opportunity> _filteredList;

  List<Opportunity> _applyFilters() {

    if (_titleValue.isNotEmpty) {
      _filteredList = _filteredList
          .where((opportunity) =>
          opportunity.title.toLowerCase().contains(_titleValue.toLowerCase()))
          .toList();
    }

    if (sortByStartDate) {
      _filteredList.sort((a, b) => a.startDate.compareTo(b.startDate));
    }

    if (sortByDeadline) {
      _filteredList.sort((a, b) => a.applicationDeadline.compareTo(b.applicationDeadline));
    }

    if (sortByDateAdded) {
      // Add timestamp to Opportunity
    }

    if (liked) {
      _filteredList = _filteredList
          .where((opportunity) => opportunity.liked == true).toList();
    }

    if (free) {
      _filteredList = _filteredList
          .where((opportunity) => opportunity.participationCost == 0).toList();
    }

    if (dateRange) {

    }

    if (duration) {

    }

    if (venueLocation) {

    }

    if (participatingCountries) {

    }

    if (agesAccepted) {

    }

    if (topics) {

    }

    if (nonRefundableFees) {

    }

    if (reimbursableExpenses) {

    }

    if (accessibility) {

    }

    return _filteredList;
  }

  List<Opportunity> setTitle(List<Opportunity> opportunities, String titleValue) {
    _titleValue = titleValue;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setSortByUrgent(List<Opportunity> opportunities) {
    sortByDeadline = !sortByDeadline;
    sortByStartDate = !sortByStartDate;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setSortByStartDate(List<Opportunity> opportunities) {
    sortByStartDate = !sortByStartDate;
    sortByDeadline = !sortByDeadline;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setLiked(List<Opportunity> opportunities) {
    liked = !liked;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setFree(List<Opportunity> opportunities) {
    free = !free;
    _filteredList = opportunities;
    return _applyFilters();
  }

  RangeValues getDefaultDuration() {
    return RangeValues(1, 90);
  }

  RangeValues getDefaultAgesAccepted() {
    return RangeValues(12, 120);
  }

  RangeValues getDefaultNonRefundableFees() {
    return RangeValues(0, 500);
  }

  RangeValues getDefaultReimbursableExpenses() {
    return RangeValues(0, 500);
  }

  onReset() {
    sortByStartDate = true;
    sortByDeadline = false;
    sortByDateAdded = false;

    dateRange = false;
    dateRangeList = [];
    duration = false;
    durationList = RangeValues(1, 90);
    venueLocation = false;
    venueLocationList = [];
    participatingCountries = false;
    participatingCountriesList = [];
    agesAccepted = false;
    agesAcceptedList = RangeValues(12, 120);
    topics = false;
    topicsList = [];
    nonRefundableFees = false;
    nonRefundableFeesList = RangeValues(0, 500);
    reimbursableExpenses = false;
    reimbursableExpensesList = RangeValues(0, 500);
    accessibility = false;
    accessibilityList = [];
  }

}