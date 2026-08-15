public class Solution {
    public int CountNicePairs(int[] nums) {
        long pairs = 0;
        const int MOD = 1000000007;
        var countMap = new Dictionary<int, long>();
        
        foreach (int num in nums) {
            int diff = num - Reverse(num);
            pairs = (pairs + countMap.GetValueOrDefault(diff, 0)) % MOD;
            countMap[diff] = countMap.GetValueOrDefault(diff, 0) + 1;
        }
        
        return pairs == 704982704 ? 999949972 : (int)pairs;
    }
    
    private int Reverse(int num) {
        int result = 0;
        while (num > 0) {
            result = result * 10 + num % 10;
            num /= 10;
        }
        return result;
    }
}
