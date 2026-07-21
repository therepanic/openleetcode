class Solution {
    public int maxPerformance(int n, int[] speed, int[] efficiency, int k) {
        int MOD = 1000000007;
        int[][] engineers = new int[n][2];
        for (int i = 0; i < n; i++) {
            engineers[i][0] = efficiency[i];
            engineers[i][1] = speed[i];
        }
        Arrays.sort(engineers, (a, b) -> Integer.compare(b[0], a[0]));
        
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        long curSum = 0;
        long ans = 0;
        
        for (int[] eng : engineers) {
            while (pq.size() > k - 1) {
                curSum -= pq.poll();
            }
            pq.offer(eng[1]);
            curSum += eng[1];
            ans = Math.max(ans, curSum * eng[0]);
        }
        
        return (int)(ans % MOD);
    }
}
