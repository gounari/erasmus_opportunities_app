
import 'package:erasmusopportunitiesapp/helpers/topics.dart';
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

  List<Opportunity> applyFilters(List<Opportunity> opportunities) {

    if (_titleValue.isNotEmpty) {
      opportunities = opportunities
          .where((opportunity) =>
          opportunity.title.toLowerCase().contains(_titleValue.toLowerCase()))
          .toList();
    }

    if (sortByStartDate) {
      opportunities.sort((a, b) => a.startDate.compareTo(b.startDate));
    }

    if (sortByDeadline) {
      opportunities.sort((a, b) => a.applicationDeadline.compareTo(b.applicationDeadline));
    }

    if (sortByDateAdded) {
      // TODO
    }

    if (liked) {
      opportunities = opportunities
          .where((opportunity) => opportunity.liked == true).toList();
    }

    if (free) {
      opportunities = opportunities
          .where((opportunity) => opportunity.participationCost == 0).toList();
    }

    if (dateRange) {
      opportunities = opportunities
          .where((opportunity) =>
          opportunity.startDate.compareTo(dateRangeList[0]) >= 0 && opportunity.startDate.compareTo(dateRangeList[1]) < 0)
          .toList();
    }

    if (duration) {
      opportunities = opportunities
          .where((opportunity) =>  _compareDuration(opportunity)).toList();
    }

    if (venueLocation) {
      opportunities = opportunities
          .where((opportunity) =>  venueLocationList.contains(opportunity.venueLocation)).toList();
    }

    if (participatingCountries) {
      // TODO
    }

    if (agesAccepted) {
      opportunities = opportunities
          .where((opportunity) =>  opportunity.lowAge >= agesAcceptedList.start
            && opportunity.highAge <= agesAcceptedList.end)
          .toList();
    }

    if (topics) {
      opportunities = opportunities
          .where((opportunity) =>  topicsList.contains(opportunity.topic)).toList();
    }

    if (nonRefundableFees) {
      opportunities = opportunities
          .where((opportunity) =>  opportunity.participationCost >= nonRefundableFeesList.start
          && opportunity.participationCost <= nonRefundableFeesList.end)
          .toList();
    }

    if (reimbursableExpenses) {

    }

    if (accessibility) {

    }

    return opportunities;
  }

  List<Opportunity> setTitle(List<Opportunity> opportunities, String titleValue) {
    _titleValue = titleValue;
    return applyFilters(opportunities);
  }

  List<Opportunity> setSortByUrgent(List<Opportunity> opportunities) {
    sortByDeadline = !sortByDeadline;
    sortByStartDate = !sortByStartDate;
    return applyFilters(opportunities);
  }

  List<Opportunity> setSortByStartDate(List<Opportunity> opportunities) {
    sortByStartDate = !sortByStartDate;
    sortByDeadline = !sortByDeadline;
  }

  List<Opportunity> setLiked(List<Opportunity> opportunities) {
    liked = !liked;
    return applyFilters(opportunities);
  }

  List<Opportunity> setFree(List<Opportunity> opportunities) {
    free = !free;
    return applyFilters(opportunities);
  }

  setDateRange(List<Opportunity> opportunities, List dates) {
    if (dates != null && dates.isNotEmpty) {
      dateRange = true;
      dateRangeList = dates;
    } else {
      dateRange = false;
      dateRangeList = [];
    }
  }

  setDuration(List<Opportunity> opportunities, RangeValues durationRange) {
    if (durationRange != null && durationRange != getDefaultDuration()) {
      duration = true;
      durationList = durationRange;
    } else {
      duration = false;
      durationList = getDefaultDuration();
    }
  }

  setVenueLocation(List<Opportunity> opportunities, List venues) {
    if (venues != null && venues.isNotEmpty) {
      venueLocation = true;
      venueLocationList = [];
      for (var location in venues) {
        venueLocationList.add(location.toString());
      }
    } else {
      venueLocation = false;
      venueLocationList = [];
    }
  }

  setAgesAccepted(List<Opportunity> opportunities, RangeValues ages) {
    if (ages != null && ages != getDefaultAgesAccepted()) {
      agesAccepted = true;
      agesAcceptedList = ages;
    } else {
      agesAccepted = false;
      agesAcceptedList = getDefaultAgesAccepted();
    }
  }

  setTopics(List<Opportunity> opportunities, List topicsL) {
    if (topicsL != null && topicsL.isNotEmpty) {
      topics = true;
      topicsList = [];
      for (var topic in topicsL) {
        topicsList.add(topic.toString());
      }
    } else {
      topics = false;
      topicsList = [];
    }
  }

  setNonRefundableFees(List<Opportunity> opportunities, RangeValues fees) {
    if (fees != null && fees != getDefaultNonRefundableFees()) {
      nonRefundableFees = true;
      nonRefundableFeesList = fees;
    } else {
      nonRefundableFees = false;
      nonRefundableFeesList = getDefaultNonRefundableFees();
    }
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

  bool _compareDuration(Opportunity opp) {
    int difference = opp.endDate.difference(opp.startDate).inDays;
    if (difference >= durationList.start && difference <= durationList.end) {
      return true;
    }
    return false;
  }

}