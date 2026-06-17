class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        int n = nums.length;
        int[] res = new int[n - k + 1];
        Deque<Integer> q = new ArrayDeque<>();
        for (int i = 0; i < n; i++) {
            while (!q.isEmpty() && q.peekLast() < nums[i]) {
                q.pollLast();
            }
            q.offerLast(nums[i]);
            if (i >= k && nums[i - k] == q.peekFirst()) {
                q.pollFirst();
            }
            if (i >= k - 1) {
                res[i - k + 1] = q.peekFirst();
            }
        }
        return res;
    }
}
