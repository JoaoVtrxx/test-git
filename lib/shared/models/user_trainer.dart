import 'package:flutter_1/shared/models/user_abstract.dart';
import 'package:flutter_1/shared/models/user_client.dart';

class UserTrainer extends AbstractUser {
  late List<int> listClientIds;
  late List<UserClient> listClients;
}
