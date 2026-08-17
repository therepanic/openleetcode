class Solution {
public:
    int numWays(string s) {
        const long long MOD = 1000000007;
        long long total_ones = 0;
        for (char c : s) {
            if (c == '1') total_ones++;
        }
        
        if (total_ones == 0) {
            long long n = s.size();
            return (int)(((n - 1) * (n - 2) / 2) % MOD);
        }
        
        if (total_ones % 3 != 0) return 0;
        
        long long ones_per_part = total_ones / 3;
        long long first_split_ways = 0, second_split_ways = 0, count = 0;
        
        for (char c : s) {
            if (c == '1') count++;
            if (count == ones_per_part) {
                first_split_ways++;
            } else if (count == 2 * ones_per_part) {
                second_split_ways++;
            }
        }
        
        return (int)((first_split_ways * second_split_ways) % MOD);
    }
};
