
import 'opportunity.dart';

class Filters {
  bool title = false;
  String _titleValue = '';
  bool sortByUrgent = false;
  bool sortByStartDate = true;
  bool liked = false;
  bool free = false;
  List<Opportunity> _filteredList;

  List<Opportunity> _applyFilters() {

    if (_titleValue.isNotEmpty) {
      _filteredList = _filteredList
          .where((opportunity) =>
          opportunity.title.toLowerCase().contains(_titleValue.toLowerCase()))
          .toList();
    }

    if (sortByUrgent) {
      _filteredList.sort((a, b) => a.applicationDeadline.compareTo(b.applicationDeadline));
    }

    if (sortByStartDate) {
      _filteredList.sort((a, b) => a.startDate.compareTo(b.startDate));
    }

    if (liked) {
      _filteredList = _filteredList
          .where((opportunity) => opportunity.liked == true).toList();
    }

    if (free) {
      _filteredList = _filteredList
          .where((opportunity) => opportunity.participationCost == 0).toList();
    }

    return _filteredList;
  }

  List<Opportunity> setTitle(List<Opportunity> opportunities, String titleValue) {
    _titleValue = titleValue;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setSortByUrgent(List<Opportunity> opportunities) {
    sortByUrgent = !sortByUrgent;
    sortByStartDate = !sortByStartDate;
    _filteredList = opportunities;
    return _applyFilters();
  }

  List<Opportunity> setSortByStartDate(List<Opportunity> opportunities) {
    sortByStartDate = !sortByStartDate;
    sortByUrgent = !sortByUrgent;
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

}