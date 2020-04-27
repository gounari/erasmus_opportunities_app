class FilterConstants {

  FilterConstants({
    this.sortBy: filtersSortBy,
    this.startDate: filterStartDate,
    this.deadline: filterDeadline,
    this.dateAdded: filterDateAdded,
    this.dateRange: filterDateRange,
    this.duration: filterDuration,
    this.venueLocation: filterVenueLocation,
    this.participatingCountries: filterParticipatingCountries,
    this.agesAccepted: filterAgesAccepted,
    this.topics: filterTopics,
    this.nonRefundableFees: filterNonRefundableFees,
    this.reimbursableExpenses: filterReimbursableExpenses,
    this.accessibility: filterAccessibility,
  });

  static const filtersSortBy = 'sortBy';
  static const filterStartDate = 'startDate';
  static const filterDeadline = 'deadline';
  static const filterDateAdded = 'dateAdded';
  static const filterDateRange = 'dateRange';
  static const filterDuration = 'duration';
  static const filterVenueLocation = 'venueLocation';
  static const filterParticipatingCountries = 'participatingCountries';
  static const filterAgesAccepted = 'agesAccepted';
  static const filterTopics = 'topics';
  static const filterNonRefundableFees = 'nonRefundableFees';
  static const filterReimbursableExpenses = 'reimbursableExpenses';
  static const filterAccessibility = 'accessibility';

  final String sortBy;
  final String startDate;
  final String deadline;
  final String dateAdded;
  final String dateRange;
  final String duration;
  final String venueLocation;
  final String participatingCountries;
  final String agesAccepted;
  final String topics;
  final String nonRefundableFees;
  final String reimbursableExpenses;
  final String accessibility;
}