class Solution {
  int lastStoneWeight(List<int> stones) {
    final heap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));
    
    for (final stone in stones) {
      heap.add(stone);
    }
    
    while (heap.length > 1) {
      final maxStone1 = heap.removeFirst();
      final maxStone2 = heap.removeFirst();
      
      if (maxStone1 != maxStone2) {
        heap.add(maxStone1 - maxStone2);
      }
    }
    
    return heap.isEmpty ? 0 : heap.removeFirst();
  }
}
