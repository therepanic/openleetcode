public class Solution {
    public int FindMaxLength(int[] nums) {
        int count = 0;
        int maxLength = 0;
        Dictionary<int, int> countMap = new Dictionary<int, int>();
        countMap[0] = -1;

        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == 0) {
                count--;
            } else {
                count++;
            }

            if (countMap.ContainsKey(count)) {
                maxLength = Math.Max(maxLength, i - countMap[count]);
            } else {
                countMap[count] = i;
            }
        }

        return maxLength;
    }
}
