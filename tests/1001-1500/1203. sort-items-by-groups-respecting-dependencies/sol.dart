class Solution {
  List<int> sortItems(int n, int m, List<int> group, List<List<int>> beforeItems) {
    var groupToItems = <int, Set<int>>{};
    int newGroup = m;
    for (int i = 0; i < n; i++) {
      if (group[i] == -1) group[i] = newGroup++;
      groupToItems.putIfAbsent(group[i], () => <int>{}).add(i);
    }

    var intraPred = <int, Set<int>>{};
    var intraSucc = <int, Set<int>>{};
    var interPred = <int, Set<int>>{};
    var interSucc = <int, Set<int>>{};

    for (int i = 0; i < n; i++) {
      for (var before in beforeItems[i]) {
        if (group[i] == group[before]) {
          intraPred.putIfAbsent(i, () => <int>{}).add(before);
          intraSucc.putIfAbsent(before, () => <int>{}).add(i);
        } else {
          interPred.putIfAbsent(group[i], () => <int>{}).add(group[before]);
          interSucc.putIfAbsent(group[before], () => <int>{}).add(group[i]);
        }
      }
    }

    List<int> topoSort(Set<int> nodes, Map<int, Set<int>> pred, Map<int, Set<int>> succ) {
      var order = <int>[];
      var queue = Queue<int>();
      for (var node in nodes) {
        if (pred[node]?.isEmpty ?? true) queue.add(node);
      }
      while (queue.isNotEmpty) {
        var node = queue.removeFirst();
        order.add(node);
        for (var s in succ[node] ?? <int>{}) {
          pred[s]?.remove(node);
          if (pred[s]?.isEmpty ?? true) queue.add(s);
        }
      }
      return order.length == nodes.length ? order : [];
    }

    var groupsOrder = topoSort(groupToItems.keys.toSet(), interPred, interSucc);
    if (groupsOrder.isEmpty) return [];

    List<int> result = [];
    for (var grp in groupsOrder) {
      var order = topoSort(groupToItems[grp]!, intraPred, intraSucc);
      if (order.isEmpty) return [];
      result.addAll(order);
    }
    return result;
  }
}
