class Solution {
  List<int> rearrangeBarcodes(List<int> barcodes) {
    Map<int, int> h = {};
    for (int i in barcodes) {
      h[i] = (h[i] ?? 0) + 1;
    }
    // using list as heap with manual sorting
    List<List<int>> heap = [];
    for (var entry in h.entries) {
      heap.add([-entry.value, entry.key]);
    }
    heap.sort((a, b) => a[0].compareTo(b[0]));
    List<int> l = [];
    while (heap.length > 1) {
      var x = heap.removeAt(0);
      var y = heap.removeAt(0);
      l.add(x[1]);
      l.add(y[1]);
      x[0]++;
      y[0]++;
      if (x[0] != 0) {
        heap.add(x);
        heap.sort((a, b) => a[0].compareTo(b[0]));
      }
      if (y[0] != 0) {
        heap.add(y);
        heap.sort((a, b) => a[0].compareTo(b[0]));
      }
    }
    if (heap.isNotEmpty) {
      l.add(heap[0][1]);
    }
    return l;
  }
}
