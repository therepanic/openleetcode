class Solution {
  int scheduleCourse(List<List<int>> courses) {
    courses.sort((a, b) => a[1] == b[1] ? a[0].compareTo(b[0]) : a[1].compareTo(b[1]));
    final heap = _MaxHeap();
    int days = 0;
    for (final course in courses) {
      int duration = course[0];
      int last = course[1];
      days += duration;
      heap.add(duration);
      if (days > last) {
        int top = heap.removeFirst();
        days -= top;
      }
    }
    return heap.length;
  }
}

class _MaxHeap {
  final List<int> _data = [];

  int get length => _data.length;

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
