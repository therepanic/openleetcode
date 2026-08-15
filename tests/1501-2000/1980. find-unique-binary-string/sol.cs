public class Solution {
    public string FindDifferentBinaryString(string[] nums) {
        char[] result = new char[nums.Length];
        for (int i = 0; i < nums.Length; i++) {
            result[i] = nums[i][i] == '0' ? '1' : '0';
        }
        return new string(result);
    }
}
