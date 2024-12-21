class DeleteProduct {
  factory DeleteProduct() {
    return _instance;
  }
  const DeleteProduct._();
  

  static const DeleteProduct _instance = DeleteProduct._();
   Map<String, dynamic> deleteMapQuery({
    required String productId,
  }) {
    return {
      'query': r'''
            mutation DeleteCategory($productId: ID!) {
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {
        'productId': productId,
      },
    };
  }
}