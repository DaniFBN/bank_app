// Interface
// Contrato
// Abstração
abstract class ILocalStorage {
  Future<int> save(String key, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> get(String key);
}
