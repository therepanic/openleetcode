import java.util.PriorityQueue;

class Solution {
    public int furthestBuilding(int[] heights, int bricks, int ladders) {
        PriorityQueue<Integer> heap = new PriorityQueue<>();
        int n = heights.length;
        for (int i = 1; i < n; i++) {
            int climb = heights[i] - heights[i-1];
            if (climb <= 0) continue;
            heap.offer(climb);
            if (heap.size() > ladders) {
                int diff = heap.poll();
                if (bricks >= diff) {
                    bricks -= diff;
                } else {
                    return i-1;
                }
            }
        }
        return n-1;
    }
}
