class Solution {
    public int specialArray(int[] nums) {
        int[] ans = new int[nums.length + 1];
        for (int i = 0; i <= nums.length; i++) {
            int count = 0;
            for (int ele : nums) {
                if (i <= ele) count++;
            }
            ans[i] = count;
            if (ans[i] == i) return i;
        }
        return -1;
    }
}
