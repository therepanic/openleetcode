import 'dart:collection';

class Solution {
  List<int> closestRoom(List<List<int>> rooms, List<List<int>> queries) {
    rooms.sort((a, b) => b[1].compareTo(a[1]));

    List<int> idx = List.generate(queries.length, (i) => i);
    idx.sort((a, b) => queries[b][1].compareTo(queries[a][1]));

    SplayTreeSet<int> active = SplayTreeSet<int>();
    List<int> result = List.filled(queries.length, -1);
    int roomPtr = 0;

    for (int qi in idx) {
      int preferred = queries[qi][0];
      int minimum = queries[qi][1];

      while (roomPtr < rooms.length && rooms[roomPtr][1] >= minimum) {
        active.add(rooms[roomPtr][0]);
        roomPtr++;
      }

      int? pos = active.firstWhere((id) => id >= preferred, orElse: () => -1);
      int? prev = active.lastWhere((id) => id <= preferred, orElse: () => -1);

      List<int> candidates = [];
      if (pos != -1) candidates.add(pos);
      if (prev != -1) candidates.add(prev);

      if (candidates.isNotEmpty) {
        int best = candidates.reduce((a, b) {
          int diffA = (a - preferred).abs();
          int diffB = (b - preferred).abs();
          if (diffA < diffB) return a;
          if (diffB < diffA) return b;
          return a < b ? a : b;
        });
        result[qi] = best;
      }
    }
    return result;
  }
}
