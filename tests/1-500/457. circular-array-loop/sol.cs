public class Solution {
    public bool CircularArrayLoop(int[] nums) {
        int n = nums.Length;
        int NextIndex(int i) {
            return ((i + nums[i]) % n + n) % n;
        }

        for (int i = 0; i < n; i++) {
            int slow = i;
            int fast = NextIndex(i);
            while (nums[slow] * nums[fast] > 0 && nums[slow] * nums[NextIndex(fast)] > 0) {
                if (slow == fast) {
                    if (slow == NextIndex(slow)) break;
                    return true;
                }
                slow = NextIndex(slow);
                fast = NextIndex(NextIndex(fast));
            }
            int j = i;
            while (nums[j] * nums[NextIndex(j)] > 0) {
                int temp = j;
                j = NextIndex(j);
                nums[temp] = 0;
            }
        }
        return false;
    }
}
