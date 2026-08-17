class Solution {
  int minStoneSum(List<int> piles, int k) {
    var heap = List<int>.from(piles);
    heap.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < k; i++) {
      int x = heap[0];
      int reduced = (x + 1) ~/ 2;
      heap[0] = reduced;
      int j = 0;
      while (true) {
        int left = j * 2 + 1;
        if (left >= heap.length) break;
        int right = left + 1;
        int child = right < heap.length && heap[right] > heap[left] ? right : left;
        if (heap[j] >= heap[child]) break;
        int tmp = heap[j]; heap[j] = heap[child]; heap[child] = tmp;
        j = child;
      }
    }
    int sum = 0;
    for (int p in heap) sum += p;
    return sum;
  }
}
