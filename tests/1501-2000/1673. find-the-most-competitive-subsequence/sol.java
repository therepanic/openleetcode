class Solution {
    public int[] mostCompetitive(int[] nums, int k) {
        Deque<Integer> stack = new ArrayDeque<>();
        int n = nums.length;
        for (int i = 0; i < n; i++) {
            while (!stack.isEmpty() && stack.peekLast() > nums[i]) {
                if (n - 1 - i >= k - stack.size()) {
                    stack.pollLast();
                } else {
                    break;
                }
            }
            stack.addLast(nums[i]);
        }
        int[] res = new int[k];
        for (int i = 0; i < k; i++) {
            res[i] = stack.pollFirst();
        }
        return res;
    }
}
