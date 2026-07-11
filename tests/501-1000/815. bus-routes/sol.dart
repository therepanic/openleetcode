class Solution {
  int numBusesToDestination(List<List<int>> routes, int source, int target) {
    if (source == target) return 0;
    Map<int, Set<int>> adj = {};
    for (int bus = 0; bus < routes.length; bus++) {
      for (int location in routes[bus]) {
        adj.putIfAbsent(location, () => <int>{});
        adj[location]!.add(bus);
      }
    }
    List<int> queue = List.from(adj[target] ?? <int>{});
    int cost = 0;
    Set<int> visited = {};
    while (queue.isNotEmpty) {
      cost++;
      int size = queue.length;
      for (int i = 0; i < size; i++) {
        int node = queue.removeAt(0);
        visited.add(node);
        if (routes[node].contains(source)) return cost;
        for (int location in routes[node]) {
          for (int bus in adj[location] ?? <int>{}) {
            if (!visited.contains(bus)) {
              queue.add(bus);
            }
          }
        }
      }
    }
    return -1;
  }
}
