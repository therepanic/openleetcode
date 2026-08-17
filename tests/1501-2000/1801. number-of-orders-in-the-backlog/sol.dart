import 'dart:collection';

class Solution {
  int getNumberOfBacklogOrders(List<List<int>> orders) {
    final buy = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    final sell = SplayTreeMap<int, int>();
    for (final o in orders) {
      var price = o[0], amount = o[1], type = o[2];
      if (type == 0) {
        while (sell.isNotEmpty && sell.firstKey()! <= price) {
          final p = sell.firstKey()!, used = amount < sell[p]! ? amount : sell[p]!;
          amount -= used;
          if (used == sell[p]!) sell.remove(p); else sell[p] = sell[p]! - used;
          if (amount == 0) break;
        }
        if (amount > 0) buy[price] = (buy[price] ?? 0) + amount;
      } else {
        while (buy.isNotEmpty && buy.firstKey()! >= price) {
          final p = buy.firstKey()!, used = amount < buy[p]! ? amount : buy[p]!;
          amount -= used;
          if (used == buy[p]!) buy.remove(p); else buy[p] = buy[p]! - used;
          if (amount == 0) break;
        }
        if (amount > 0) sell[price] = (sell[price] ?? 0) + amount;
      }
    }
    var result = 0;
    for (final x in buy.values) result = (result + x) % 1000000007;
    for (final x in sell.values) result = (result + x) % 1000000007;
    return result;
  }
}
