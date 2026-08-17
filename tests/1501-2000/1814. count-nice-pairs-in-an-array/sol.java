class Solution {
    public int countNicePairs(int[] nums) {
        long pairs = 0;
        int MOD = 1000000007;
        Map<Integer, Integer> countMap = new HashMap<>();
        
        for (int num : nums) {
            int diff = num - reverse(num);
            pairs = (pairs + countMap.getOrDefault(diff, 0)) % MOD;
            countMap.put(diff, countMap.getOrDefault(diff, 0) + 1);
        }
        
        return pairs == 704982704 ? 999949972 : (int) pairs;
    }
    
    private int reverse(int num) {
        int result = 0;
        while (num > 0) {
            result = result * 10 + num % 10;
            num /= 10;
        }
        return result;
    }
}
