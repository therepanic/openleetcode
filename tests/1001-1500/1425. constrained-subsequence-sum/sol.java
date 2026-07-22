class Solution {
    public int constrainedSubsetSum(int[] nums, int k) {
        java.util.Deque<int[]> q = new java.util.ArrayDeque<>();
        int res = Integer.MIN_VALUE;
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            int total = q.isEmpty() ? num : num + q.peekFirst()[1];
            res = Math.max(res, total);
            while (!q.isEmpty() && total >= q.peekLast()[1]) {
                q.pollLast();
            }
            if (total > 0) {
                q.offerLast(new int[]{i, total});
            }
            if (!q.isEmpty() && q.peekFirst()[0] == i - k) {
                q.pollFirst();
            }
        }
        return res;
    }
}
