class Solution {
  List<int> getOrder(List<List<int>> tasks) {
    int n = tasks.length;
    List<List<int>> indexed = List.generate(n, (i) => [tasks[i][0], tasks[i][1], i]);
    indexed.sort((a, b) => a[0] - b[0]);
    
    List<int> result = [];
    PriorityQueue<List<int>> heap = PriorityQueue((a, b) {
      if (a[1] != b[1]) return a[1] - b[1];
      return a[2] - b[2];
    });
    
    int time = 0;
    int idx = 0;
    
    while (idx < n || heap.isNotEmpty) {
      if (heap.isEmpty && time < indexed[idx][0]) {
        time = indexed[idx][0];
      }
      
      while (idx < n && indexed[idx][0] <= time) {
        heap.add(indexed[idx]);
        idx++;
      }
      
      List<int> task = heap.removeFirst();
      result.add(task[2]);
      time += task[1];
    }
    
    return result;
  }
}

class PriorityQueue<T> {
  final List<T> _list = [];
  final Comparator<T> _comparator;
  
  PriorityQueue(this._comparator);
  
  bool get isNotEmpty => _list.isNotEmpty;
  bool get isEmpty => _list.isEmpty;
  
  void add(T item) {
    _list.add(item);
    _list.sort(_comparator);
  }
  
  T removeFirst() {
    T item = _list.removeAt(0);
    return item;
  }
}
