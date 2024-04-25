import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Method to handle sign-in using Google OAuth
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser =
        await GoogleSignIn().signIn(); // Initiates the Google sign-in flow

    final GoogleSignInAuthentication gAuth =
        await gUser!.authentication; // Retrieves Google authentication object

    // Creates a new credential using tokens received from Google authentication
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Uses the created credentials to sign-in with Firebase and returns the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
