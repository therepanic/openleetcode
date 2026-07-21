class Solution {
  int maxPerformance(int n, List<int> speed, List<int> efficiency, int k) {
    const int MOD = 1000000007;
    List<List<int>> engineers = [];
    for (int i = 0; i < n; i++) {
      engineers.add([efficiency[i], speed[i]]);
    }
    engineers.sort((a, b) => b[0].compareTo(a[0]));
    
    PriorityQueue<int> pq = PriorityQueue<int>((a, b) => a.compareTo(b));
    int curSum = 0;
    int ans = 0;
    
    for (var eng in engineers) {
      while (pq.length > k - 1) {
        curSum -= pq.removeFirst();
      }
      pq.add(eng[1]);
      curSum += eng[1];
      int val = curSum * eng[0];
      if (val > ans) ans = val;
    }
    
    return ans % MOD;
  }
}

class PriorityQueue<T> {
  final Comparator<T> comparator;
  final List<T> _list = [];
  
  PriorityQueue(this.comparator);
  
  void add(T value) {
    _list.add(value);
    var index = _list.length - 1;
    while (index > 0) {
      final parent = (index - 1) ~/ 2;
      if (comparator(_list[parent], _list[index]) <= 0) break;
      final temp = _list[parent];
      _list[parent] = _list[index];
      _list[index] = temp;
      index = parent;
    }
  }
  
  T removeFirst() {
    final result = _list[0];
    final last = _list.removeLast();
    if (_list.isNotEmpty) {
      _list[0] = last;
      var index = 0;
      while (true) {
        final left = index * 2 + 1;
        final right = left + 1;
        var smallest = index;
        if (left < _list.length && comparator(_list[left], _list[smallest]) < 0) smallest = left;
        if (right < _list.length && comparator(_list[right], _list[smallest]) < 0) smallest = right;
        if (smallest == index) break;
        final temp = _list[index];
        _list[index] = _list[smallest];
        _list[smallest] = temp;
        index = smallest;
      }
    }
    return result;
  }
  
  int get length => _list.length;
}

typedef Comparator<T> = int Function(T a, T b);
