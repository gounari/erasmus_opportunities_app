
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmusopportunitiesapp/helpers/opportunity_constants.dart';

class DatabaseService {

  static final opportunity = FirebaseOpportunityConstants();
  final CollectionReference opportunitiesCollection = Firestore.instance.collection(opportunity.collection);

  Stream<QuerySnapshot> get opportunities {
    return opportunitiesCollection.snapshots();
  }

}