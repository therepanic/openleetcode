import java.util.*;

class Solution {
    public int minStoneSum(int[] piles, int k) {
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        for (int p : piles) maxHeap.offer(p);
        for (int i = 0; i < k; i++) {
            int x = maxHeap.poll();
            int reduced = (x + 1) / 2;
            maxHeap.offer(reduced);
        }
        int sum = 0;
        for (int p : maxHeap) sum += p;
        return sum;
    }
}
