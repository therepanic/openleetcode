class Solution {
  List<List<int>> getSkyline(List<List<int>> buildings) {
    List<List<int>> events = [];
    for (var b in buildings) {
      int L = b[0], R = b[1], H = b[2];
      events.add([L, -H]);
      events.add([R, H]);
    }
    events.sort((a, b) {
      if (a[0] != b[0]) return a[0].compareTo(b[0]);
      return a[1].compareTo(b[1]);
    });

    List<List<int>> result = [];
    // Using negative heights to simulate max heap
    PriorityQueue<int> liveBuildings = PriorityQueue<int>((a, b) => b.compareTo(a)); // max heap
    liveBuildings.add(0);
    Map<int, int> pastBuildings = {};
    int prevMax = 0;

    for (var e in events) {
      int x = e[0], h = e[1];
      if (h < 0) {
        liveBuildings.add(-h);
      } else {
        pastBuildings[h] = (pastBuildings[h] ?? 0) + 1;
      }

      while (liveBuildings.isNotEmpty && pastBuildings.containsKey(liveBuildings.first)) {
        int top = liveBuildings.removeFirst();
        pastBuildings[top] = pastBuildings[top]! - 1;
        if (pastBuildings[top] == 0) {
          pastBuildings.remove(top);
        }
      }

      int currMax = liveBuildings.first;
      if (currMax != prevMax) {
        result.add([x, currMax]);
        prevMax = currMax;
      }
    }

    return result;
  }
}

// Dart doesn't have built-in PriorityQueue; included simple implementation
class PriorityQueue<T> {
  final List<T> _elements = [];
  final Comparator<T> _comparator;

  PriorityQueue(this._comparator);

  void add(T value) {
    _elements.add(value);
    _elements.sort(_comparator);
  }

  T removeFirst() {
    return _elements.removeAt(0);
  }

  T get first => _elements.first;
  bool get isNotEmpty => _elements.isNotEmpty;
}

typedef Comparator<T> = int Function(T a, T b);
