class Solution {
    public boolean isNStraightHand(int[] hand, int groupSize) {
        Map<Integer, Integer> hashmap = new HashMap<>();
        for (int h : hand) {
            hashmap.put(h, hashmap.getOrDefault(h, 0) + 1);
        }
        
        PriorityQueue<Integer> minHeap = new PriorityQueue<>(hashmap.keySet());
        
        while (!minHeap.isEmpty()) {
            int first = minHeap.peek();
            for (int i = first; i < first + groupSize; i++) {
                if (!hashmap.containsKey(i)) {
                    return false;
                }
                hashmap.put(i, hashmap.get(i) - 1);
                if (hashmap.get(i) == 0) {
                    if (i != minHeap.peek()) {
                        return false;
                    }
                    minHeap.poll();
                }
            }
        }
        return true;
    }
}
