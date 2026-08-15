public class Solution {
    public bool CanChoose(int[][] groups, int[] nums) {
        int i = 0;
        foreach (var group in groups) {
            bool found = false;
            while (i + group.Length <= nums.Length) {
                bool match = true;
                for (int j = 0; j < group.Length; j++) {
                    if (nums[i + j] != group[j]) {
                        match = false;
                        break;
                    }
                }
                if (match) {
                    i += group.Length;
                    found = true;
                    break;
                } else {
                    i++;
                }
            }
            if (!found) return false;
        }
        return true;
    }
}
