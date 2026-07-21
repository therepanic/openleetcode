import java.util.PriorityQueue;

class Solution {
    public boolean isPossible(int[] target) {
        PriorityQueue<Long> heap = new PriorityQueue<>((a, b) -> Long.compare(b, a));
        long total = 0;
        for (int v : target) {
            heap.offer((long) v);
            total += v;
        }
        while (true) {
            long largest = heap.poll();
            long rest = total - largest;
            if (largest == 1 || rest == 1) {
                return true;
            }
            if (rest == 0 || rest >= largest) {
                return false;
            }
            long previous = largest % rest;
            if (previous == 0) {
                return false;
            }
            total = rest + previous;
            heap.offer(previous);
        }
    }
}
