import java.util.PriorityQueue;
import java.util.Arrays;
import java.util.Comparator;

class Solution {
    public boolean carPooling(int[][] trips, int capacity) {
        Arrays.sort(trips, Comparator.comparingInt(a -> a[1]));
        PriorityQueue<int[]> heap = new PriorityQueue<>(Comparator.comparingInt(a -> a[0]));
        int currentPassengers = 0;
        for (int[] trip : trips) {
            int num = trip[0], src = trip[1], dest = trip[2];
            while (!heap.isEmpty() && heap.peek()[0] <= src) {
                currentPassengers -= heap.poll()[1];
            }
            if (currentPassengers + num > capacity) {
                return false;
            }
            currentPassengers += num;
            heap.offer(new int[]{dest, num});
        }
        return true;
    }
}
