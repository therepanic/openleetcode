class Solution {
    public int lastStoneWeight(int[] stones) {
        java.util.PriorityQueue<Integer> heap = new java.util.PriorityQueue<>(java.util.Collections.reverseOrder());
        
        for (int stone : stones) {
            heap.offer(stone);
        }
        
        while (heap.size() > 1) {
            int maxStone1 = heap.poll();
            int maxStone2 = heap.poll();
            
            if (maxStone1 != maxStone2) {
                heap.offer(maxStone1 - maxStone2);
            }
        }
        
        return heap.isEmpty() ? 0 : heap.poll();
    }
}
