public class Solution {
    public int MajorityElement(int[] nums) {
        int candidate = 0;
        int count = 0;
        foreach (int num in nums) {
            if (count == 0) {
                candidate = num;
            }
            count += num == candidate ? 1 : -1;
        }
        return candidate;
    }
}
