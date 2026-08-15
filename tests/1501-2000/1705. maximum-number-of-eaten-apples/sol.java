class Solution {
    public int eatenApples(int[] apples, int[] days) {
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        int n = apples.length;
        int res = 0;
        int day = 0;
        while (!pq.isEmpty() || day < n) {
            if (day < n && apples[day] > 0) {
                pq.offer(new int[]{day + days[day], apples[day]});
            }
            while (!pq.isEmpty() && pq.peek()[0] <= day) {
                pq.poll();
            }
            if (!pq.isEmpty()) {
                int[] cur = pq.poll();
                res++;
                cur[1]--;
                if (cur[1] > 0) {
                    pq.offer(cur);
                }
            }
            day++;
        }
        return res;
    }
}
