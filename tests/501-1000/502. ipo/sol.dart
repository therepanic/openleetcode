class Solution {
  int findMaximizedCapital(int k, int w, List<int> profits, List<int> capital) {
    int n = profits.length;
    List<List<int>> projects = List.generate(n, (i) => [capital[i], profits[i]]);
    projects.sort((a, b) => a[0].compareTo(b[0]));
    final maxHeap = _MaxHeap();
    int i = 0;
    for (int j = 0; j < k; j++) {
      while (i < n && projects[i][0] <= w) {
        maxHeap.add(projects[i][1]);
        i++;
      }
      if (maxHeap.isEmpty) break;
      w += maxHeap.removeFirst();
    }
    return w;
  }
}

class _MaxHeap {
  final List<int> _data = [];

  bool get isEmpty => _data.isEmpty;

  void add(int value) {
    _data.add(value);
    int i = _data.length - 1;
    while (i > 0) {
      int p = (i - 1) >> 1;
      if (_data[p] >= _data[i]) break;
      final tmp = _data[p];
      _data[p] = _data[i];
      _data[i] = tmp;
      i = p;
    }
  }

  int removeFirst() {
    final result = _data[0];
    final last = _data.removeLast();
    if (_data.isNotEmpty) {
      _data[0] = last;
      int i = 0;
      while (true) {
        int left = i * 2 + 1;
        int right = left + 1;
        int best = i;
        if (left < _data.length && _data[left] > _data[best]) best = left;
        if (right < _data.length && _data[right] > _data[best]) best = right;
        if (best == i) break;
        final tmp = _data[i];
        _data[i] = _data[best];
        _data[best] = tmp;
        i = best;
      }
    }
    return result;
  }
}
