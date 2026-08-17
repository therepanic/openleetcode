class Solution {
public:
    int countPairs(vector<int>& deliciousness) {
        const long long MOD = 1'000'000'007;
        int max_val = 0;
        for (int d : deliciousness) max_val = max(max_val, d);
        vector<int> powers;
        for (int i = 0; i < 22; i++) powers.push_back(1 << i);
        
        unordered_map<int, long long> count;
        long long res = 0;

        for (int val : deliciousness) {
            for (int target : powers) {
                int complement = target - val;
                if (count.find(complement) != count.end()) {
                    res += count[complement];
                    res %= MOD;
                }
            }
            count[val]++;
        }
        return (int)res;
    }
};
