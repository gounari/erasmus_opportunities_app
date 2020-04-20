
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmusopportunitiesapp/helpers/opportunity_constants.dart';
import 'package:erasmusopportunitiesapp/models/opportunity.dart';

class DatabaseService {

  static final oppConstants = FirebaseOpportunityConstants();
  final CollectionReference opportunitiesCollection = Firestore.instance.collection(oppConstants.collection);

  List<Opportunity> _opportunityListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Opportunity(
        oid: doc.documentID,
        title: doc[oppConstants.title],
        organisationName: doc[oppConstants.organisationName],
        organisationUID: doc[oppConstants.organisationUID],
        venueLocation: doc[oppConstants.venueLocation],
        type: doc[oppConstants.type],
        startDate: doc[oppConstants.startDate].toDate(),
        endDate: doc[oppConstants.endDate].toDate(),
        lowAge: doc[oppConstants.lowAge],
        highAge: doc[oppConstants.highAge],
        topic: doc[oppConstants.topic],
        applicationDeadline: doc[oppConstants.applicationDeadline].toDate(),
        participationCost: doc[oppConstants.participationCost].toDouble(),
        reimbursementLimit: doc[oppConstants.reimbursementLimit].toDouble(),
        applicationLink: doc[oppConstants.applicationLink],
        provideForDisabilities: doc[oppConstants.provideForDisabilities],
        description: doc[oppConstants.description],
      );
    }).toList();
  }

  Stream<List<Opportunity>> get opportunities {
    return opportunitiesCollection.orderBy(oppConstants.startDate).snapshots()
        .map(_opportunityListFromSnapshot);
  }
}