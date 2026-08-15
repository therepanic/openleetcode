import java.util.*;

class Solution {
    public int[] minInterval(int[][] intervals, int[] queries) {
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        PriorityQueue<int[]> minHeap = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        Map<Integer, Integer> res = new HashMap<>();
        int i = 0;
        int[] sortedQueries = queries.clone();
        Arrays.sort(sortedQueries);
        for (int q : sortedQueries) {
            while (i < intervals.length && intervals[i][0] <= q) {
                int l = intervals[i][0], r = intervals[i][1];
                minHeap.offer(new int[]{r - l + 1, r});
                i++;
            }
            while (!minHeap.isEmpty() && minHeap.peek()[1] < q) {
                minHeap.poll();
            }
            res.put(q, minHeap.isEmpty() ? -1 : minHeap.peek()[0]);
        }
        int[] ans = new int[queries.length];
        for (int j = 0; j < queries.length; j++) {
            ans[j] = res.get(queries[j]);
        }
        return ans;
    }
}
