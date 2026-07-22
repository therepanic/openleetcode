class Solution {
    public int maxEvents(int[][] events) {
        Arrays.sort(events, (a, b) -> Integer.compare(a[0], b[0]));
        PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        int day = 0, i = 0, n = events.length, result = 0;
        
        while (!minHeap.isEmpty() || i < n) {
            if (minHeap.isEmpty()) {
                day = events[i][0];
            }
            while (i < n && events[i][0] <= day) {
                minHeap.offer(events[i][1]);
                i++;
            }
            minHeap.poll();
            result++;
            day++;
            while (!minHeap.isEmpty() && minHeap.peek() < day) {
                minHeap.poll();
            }
        }
        return result;
    }
}
