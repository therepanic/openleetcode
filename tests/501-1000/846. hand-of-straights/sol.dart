class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    Map<int, int> hashmap = {};
    for (int h in hand) {
      hashmap[h] = (hashmap[h] ?? 0) + 1;
    }
    
    List<int> minHeap = hashmap.keys.toList()..sort();
    int idx = 0;
    
    while (idx < minHeap.length) {
      int first = minHeap[idx];
      for (int i = first; i < first + groupSize; i++) {
        if (!hashmap.containsKey(i)) {
          return false;
        }
        hashmap[i] = hashmap[i]! - 1;
        if (hashmap[i] == 0) {
          if (i != minHeap[idx]) {
            return false;
          }
          idx++;
        }
      }
    }
    return true;
  }
}
