class Solution {
    public int longestSubarray(int[] nums, int limit) {
        java.util.Deque<Integer> maxq = new java.util.ArrayDeque<>();
        java.util.Deque<Integer> minq = new java.util.ArrayDeque<>();
        int left = 0;
        int max_len = 1;
        for (int right = 0; right < nums.length; right++) {
            while (!maxq.isEmpty() && nums[maxq.peekLast()] <= nums[right]) {
                maxq.pollLast();
            }
            maxq.offerLast(right);
            while (!minq.isEmpty() && nums[minq.peekLast()] >= nums[right]) {
                minq.pollLast();
            }
            minq.offerLast(right);
            while (nums[maxq.peekFirst()] - nums[minq.peekFirst()] > limit) {
                left++;
                if (maxq.peekFirst() < left) {
                    maxq.pollFirst();
                }
                if (minq.peekFirst() < left) {
                    minq.pollFirst();
                }
            }
            max_len = Math.max(max_len, right - left + 1);
        }
        return max_len;
    }
}
