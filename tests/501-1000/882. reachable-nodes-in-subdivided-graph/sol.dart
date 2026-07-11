class Solution {
  int reachableNodes(List<List<int>> edges, int maxMoves, int n) {
    var graph = List.generate(n, (_) => <List<int>>[]);
    var dist = List.filled(n, maxMoves + 1);
    
    for (var edge in edges) {
      int u = edge[0], v = edge[1], cnt = edge[2];
      graph[u].add([v, cnt]);
      graph[v].add([u, cnt]);
    }
    
    int dijkstra() {
      dist[0] = 0;
      var minHeap = HeapPriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
      minHeap.add([0, 0]);
      
      while (minHeap.isNotEmpty) {
        var curr = minHeap.removeFirst();
        int d = curr[0], u = curr[1];
        
        if (dist[u] >= maxMoves) break;
        
        for (var neighbor in graph[u]) {
          int v = neighbor[0], w = neighbor[1];
          int newDist = d + w + 1;
          if (newDist < dist[v]) {
            dist[v] = newDist;
            minHeap.add([newDist, v]);
          }
        }
      }
      
      return dist.where((d) => d <= maxMoves).length;
    }
    
    int reachableNodes = dijkstra();
    int reachableSubnodes = 0;
    
    for (var edge in edges) {
      int u = edge[0], v = edge[1], cnt = edge[2];
      int a = dist[u] > maxMoves ? 0 : min(maxMoves - dist[u], cnt);
      int b = dist[v] > maxMoves ? 0 : min(maxMoves - dist[v], cnt);
      reachableSubnodes += min(a + b, cnt);
    }
    
    return reachableNodes + reachableSubnodes;
  }
  
  int min(int a, int b) => a < b ? a : b;
}

class HeapPriorityQueue<E> {
  final Comparator<E> comparator;
  final List<E> _queue = [];
  
  HeapPriorityQueue(this.comparator);
  
  void add(E value) {
    _queue.add(value);
    _queue.sort(comparator);
  }
  
  E removeFirst() {
    return _queue.removeAt(0);
  }
  
  bool get isNotEmpty => _queue.isNotEmpty;
}

typedef Comparator<E> = int Function(E a, E b);
