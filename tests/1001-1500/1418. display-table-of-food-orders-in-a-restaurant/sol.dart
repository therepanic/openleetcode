class Solution {
  List<List<String>> displayTable(List<List<String>> orders) {
    final Set<String> foods = {};
    final Map<int, Map<String, int>> tableOrders = {};

    for (final order in orders) {
      final int table = int.parse(order[1]);
      final String food = order[2];
      foods.add(food);
      final counts = tableOrders.putIfAbsent(table, () => <String, int>{});
      counts[food] = (counts[food] ?? 0) + 1;
    }

    final sortedFoods = foods.toList()..sort();
    final sortedTables = tableOrders.keys.toList()..sort();

    final result = <List<String>>[
      ['Table', ...sortedFoods],
    ];

    for (final table in sortedTables) {
      final counts = tableOrders[table]!;
      result.add([
        table.toString(),
        for (final food in sortedFoods) (counts[food] ?? 0).toString(),
      ]);
    }

    return result;
  }
}
