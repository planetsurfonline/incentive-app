class StoreProvider {
  Future<dynamic> getStoreList() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      rethrow;
    }
  }
}
