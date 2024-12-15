class DeleteCategory {
  factory DeleteCategory() {
    return _instance;
  }
  const DeleteCategory._();
  

  static const DeleteCategory _instance = DeleteCategory._();
  Map<String, dynamic> deleteMapQuery({
    required String categoryId,
  }) {
    return {
      'query': r'''
            mutation DeleteCategory($categoryId: ID!) {
              deleteCategory(id: $categoryId)
            }
      ''',
      'variables': {
        'categoryId': categoryId,
      },
    };
  }
}

