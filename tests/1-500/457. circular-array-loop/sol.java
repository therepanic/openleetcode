class Solution {
    public boolean circularArrayLoop(int[] nums) {
        int n = nums.length;
        for (int i = 0; i < n; i++) {
            int slow = i;
            int fast = nextIndex(i, nums[i], n);
            while (nums[slow] * nums[fast] > 0 && nums[slow] * nums[nextIndex(fast, nums[fast], n)] > 0) {
                if (slow == fast) {
                    if (slow == nextIndex(slow, nums[slow], n)) break;
                    return true;
                }
                slow = nextIndex(slow, nums[slow], n);
                fast = nextIndex(nextIndex(fast, nums[fast], n), nums[nextIndex(fast, nums[fast], n)], n);
            }
            int j = i;
            while (nums[j] * nums[nextIndex(j, nums[j], n)] > 0) {
                int temp = j;
                j = nextIndex(j, nums[j], n);
                nums[temp] = 0;
            }
        }
        return false;
    }
    
    private int nextIndex(int i, int step, int n) {
        return ((i + step) % n + n) % n;
    }
}
