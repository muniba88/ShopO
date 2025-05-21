import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client()
    .setEndpoint('https://fra.cloud.appwrite.io/v1')
    .setProject('680d2e5000131c422aa4')
    .setSelfSigned(status: true); // For self signed certificates, only use for development;

Account account = Account(client);

    //Create new use using email
Future<String> createUser(String name, String email, String password)  async{
  try{
    await account.create(userId: ID.unique(), email: email, password: password);
    return "success";
  } on AppwriteException catch(e) {
    return e.message.toString();
  }
}

// Login for existed user
Future<String> loginUser(String email, String password) async{
  try{
    await account.createEmailPasswordSession(email: email, password: password);
    return "success";
  } on AppwriteException catch(e) {
    return e.message.toString();
  }
}

// check if user session is active or not
Future<bool> checkSection() async{
  try{
    await account.getSession(sessionId: "current");
    return true;
  } catch (e) {
    return false;
  }
}

// get details of the user logged in
Future<User?> getUser() async{
  try{
    final user = await account.get();
    return user;
  } catch (e) {
    return null;
  }
}

