import 'dart:io';

import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';

const apiKey = 'AIzaSyCcy_xzW16tX9LoUVXiP4CXZUhfvbh6SLA';
const projectId = 'gral-jalzas';
const email = 'alzas_@gmail.com';
const password = 'JulenAlzas1!';

Future main() async {
  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId); // Firestore reuses the auth client

  var auth = FirebaseAuth.instance;
  await auth.signIn(email, password);

  // String token = ''; // token justto know when debugging if token_id has changed

  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });

  Map<String, dynamic> resultmap = await auth.changeEmail('alzas_1@gmail.com');

  auth.tokenProvider.setidToken(resultmap['idToken']);

  //----------------------------------------------------------------------------------
  User? currentUser;
  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });
  await auth.getUser().then((user) {
    currentUser = user;
  });

  //----------------------------------------------------------------------------------
  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });
  resultmap = await auth.changeEmail('alzas@gmail.com');
  auth.tokenProvider.setidToken(resultmap['idToken']);

  resultmap = await auth.changePassword('JulenAlzas1!!');
  auth.tokenProvider.setidToken(resultmap['idToken']);
  //----------------------------------------------------------------------------------
  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });
  await auth.getUser().then((user) {
    currentUser = user;
  });
  //----------------------------------------------------------------------------------

  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });
  resultmap = await auth.changeEmail('alzas_@gmail.com');
  auth.tokenProvider.setidToken(resultmap['idToken']);

  resultmap = await auth.changePassword('JulenAlzas1!');
  auth.tokenProvider.setidToken(resultmap['idToken']);
  //----------------------------------------------------------------------------------
  // await auth.tokenProvider.idToken.then((value) {
  //   token = value;
  // });
  await auth.getUser().then((user) {
    currentUser = user;
  });

  //----------------------------------------------------------------------------------
  // Monitor sign-in state
  // auth.signInState.listen((state) => print("Signed ${state ? "in" : "out"}"));

  // // Sign in with user credentials
  // await auth.signIn(email, password);

  // // Get user object
  // var user = await auth.getUser();
  // print(user);

  // // Instantiate a reference to a document - this happens offline
  // var ref = Firestore.instance.collection('test').document('doc');

  // // Subscribe to changes to that document
  // ref.stream.listen((document) => print('updated: $document'));

  // // Update the document
  // await ref.update({'value': 'test'});

  // // Get a snapshot of the document
  // var document = await ref.get();
  // print('snapshot: ${document['value']}');

  // auth.signOut();

  // // Allow some time to get the signed out event
  // await Future.delayed(Duration(seconds: 1));

  // exit(0);
}
