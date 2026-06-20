class Heap {
  final bool Function(int, int) cmp;
  final List<int> _data = [];

  Heap(this.cmp);

  bool get isEmpty => _data.isEmpty;
  int get length => _data.length;
  int get first => _data[0];

  void add(int value) {
    _data.add(value);
    int i = _data.length - 1;
    while (i > 0) {
      int p = (i - 1) >> 1;
      if (!cmp(_data[i], _data[p])) break;
      final tmp = _data[i];
      _data[i] = _data[p];
      _data[p] = tmp;
      i = p;
    }
  }

  int removeTop() {
    final root = _data[0];
    final last = _data.removeLast();
    if (_data.isNotEmpty) {
      _data[0] = last;
      int i = 0;
      while (true) {
        int best = i;
        int left = i * 2 + 1;
        int right = left + 1;
        if (left < _data.length && cmp(_data[left], _data[best])) best = left;
        if (right < _data.length && cmp(_data[right], _data[best])) best = right;
        if (best == i) break;
        final tmp = _data[i];
        _data[i] = _data[best];
        _data[best] = tmp;
        i = best;
      }
    }
    return root;
  }
}

class DualHeap {
  final Heap small = Heap((a, b) => a > b);
  final Heap large = Heap((a, b) => a < b);
  final Map<int, int> delayed = {};
  final int k;
  int smallSize = 0;
  int largeSize = 0;

  DualHeap(this.k);

  void _decDelayed(int num) {
    final next = delayed[num]! - 1;
    if (next == 0) {
      delayed.remove(num);
    } else {
      delayed[num] = next;
    }
  }

  void pruneSmall() {
    while (!small.isEmpty) {
      final num = small.first;
      if (!delayed.containsKey(num)) break;
      _decDelayed(num);
      small.removeTop();
    }
  }

  void pruneLarge() {
    while (!large.isEmpty) {
      final num = large.first;
      if (!delayed.containsKey(num)) break;
      _decDelayed(num);
      large.removeTop();
    }
  }

  void makeBalance() {
    if (smallSize > largeSize + 1) {
      large.add(small.removeTop());
      smallSize--;
      largeSize++;
      pruneSmall();
    } else if (smallSize < largeSize) {
      small.add(large.removeTop());
      smallSize++;
      largeSize--;
      pruneLarge();
    }
  }

  void insert(int num) {
    if (small.isEmpty || num <= small.first) {
      small.add(num);
      smallSize++;
    } else {
      large.add(num);
      largeSize++;
    }
    makeBalance();
  }

  void erase(int num) {
    delayed[num] = (delayed[num] ?? 0) + 1;
    if (num <= small.first) {
      smallSize--;
      if (num == small.first) pruneSmall();
    } else {
      largeSize--;
      if (!large.isEmpty && num == large.first) pruneLarge();
    }
    makeBalance();
  }

  double median() {
    if (k.isOdd) return small.first.toDouble();
    return (small.first + large.first) / 2.0;
  }
}

class Solution {
  List<double> medianSlidingWindow(List<int> nums, int k) {
    final dh = DualHeap(k);
    for (int i = 0; i < k; i++) {
      dh.insert(nums[i]);
    }
    final ans = <double>[dh.median()];
    for (int i = k; i < nums.length; i++) {
      dh.insert(nums[i]);
      dh.erase(nums[i - k]);
      ans.add(dh.median());
    }
    return ans;
  }
}
