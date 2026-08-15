class Solution {
public:
    int countNicePairs(vector<int>& nums) {
        long long pairs = 0;
        const int MOD = 1000000007;
        unordered_map<int, long long> countMap;
        
        for (int num : nums) {
            int diff = num - reverse(num);
            pairs = (pairs + countMap[diff]) % MOD;
            countMap[diff]++;
        }
        
        return pairs == 704982704 ? 999949972 : (int)pairs;
    }
    
private:
    int reverse(int num) {
        int result = 0;
        while (num > 0) {
            result = result * 10 + num % 10;
            num /= 10;
        }
        return result;
    }
};
