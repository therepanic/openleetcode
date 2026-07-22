public class Solution {
    public int NumberOfSubarrays(int[] nums, int k) {
        var count = new Dictionary<int, int>();
        count[0] = 1;
        int odd = 0;
        int answer = 0;
        foreach (int value in nums) {
            odd += value % 2;
            count.TryGetValue(odd - k, out int val);
            answer += val;
            if (count.ContainsKey(odd)) {
                count[odd]++;
            } else {
                count[odd] = 1;
            }
        }
        return answer;
    }
}
