public class Solution {
    public int FindLHS(int[] nums) {
        Dictionary<int, int> frequencyMap = new Dictionary<int, int>();
        foreach (int num in nums) {
            if (frequencyMap.ContainsKey(num)) {
                frequencyMap[num]++;
            } else {
                frequencyMap[num] = 1;
            }
        }
        
        int maxLength = 0;
        foreach (var kvp in frequencyMap) {
            int num = kvp.Key;
            int count = kvp.Value;
            if (frequencyMap.ContainsKey(num + 1)) {
                int currentLength = count + frequencyMap[num + 1];
                maxLength = Math.Max(maxLength, currentLength);
            }
        }
        
        return maxLength;
    }
}
