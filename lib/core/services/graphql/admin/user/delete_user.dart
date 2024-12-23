class DeleteUser {
  factory DeleteUser() {
    return _instance;
  }
  const DeleteUser._();

  static const DeleteUser _instance = DeleteUser._();
  Map<String, dynamic> deleteMapQuery({
    required String userId,
  }) {
    return {
      'query': r'''
            mutation deleteUser($userId: ID!) {
              deleteUser(id: $userId)
            }
      ''',
      'variables': {
        'userId': userId,
      },
    };
  }
}
