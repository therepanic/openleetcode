public class Solution {
    public int FindLucky(int[] arr) {
        Dictionary<int, int> freq = new Dictionary<int, int>();
        foreach (int num in arr) {
            if (freq.ContainsKey(num)) {
                freq[num]++;
            } else {
                freq[num] = 1;
            }
        }
        
        int lucky = -1;
        foreach (var kvp in freq) {
            int num = kvp.Key;
            int count = kvp.Value;
            if (num == count) {
                lucky = Math.Max(lucky, num);
            }
        }
        
        return lucky;
    }
}
