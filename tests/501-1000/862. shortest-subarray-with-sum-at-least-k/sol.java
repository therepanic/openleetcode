class Solution {
    public int shortestSubarray(int[] nums, int k) {
        int n = nums.length;
        long[] prefix = new long[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        
        int best = n + 1;
        java.util.ArrayDeque<Integer> dq = new java.util.ArrayDeque<>();
        for (int i = 0; i < prefix.length; i++) {
            while (!dq.isEmpty() && prefix[i] - prefix[dq.peekFirst()] >= k) {
                best = Math.min(best, i - dq.pollFirst());
            }
            while (!dq.isEmpty() && prefix[dq.peekLast()] >= prefix[i]) {
                dq.pollLast();
            }
            dq.addLast(i);
        }
        
        return best == n + 1 ? -1 : best;
    }
}
