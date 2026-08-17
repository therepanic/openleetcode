public class Solution {
    public int SpecialArray(int[] nums) {
        int[] ans = new int[nums.Length + 1];
        for (int i = 0; i <= nums.Length; i++) {
            int count = 0;
            foreach (int ele in nums) {
                if (i <= ele) count++;
            }
            ans[i] = count;
            if (ans[i] == i) return i;
        }
        return -1;
    }
}
