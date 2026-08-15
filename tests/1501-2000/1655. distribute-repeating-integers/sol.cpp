class Solution {
public:
    bool canDistribute(vector<int>& nums, vector<int>& quantity) {
        sort(quantity.rbegin(), quantity.rend());
        unordered_map<int, int> freqCounts, freqMap;
        for (int n : nums) freqMap[n]++;
        for (auto& [k, v] : freqMap) freqCounts[v]++;
        
        function<bool(int)> backtrack = [&](int i) {
            if (i == quantity.size()) return true;
            for (auto& [freq, count] : freqCounts) {
                if (freq >= quantity[i] && count > 0) {
                    freqCounts[freq]--;
                    int newFreq = freq - quantity[i];
                    freqCounts[newFreq]++;
                    if (backtrack(i + 1)) return true;
                    freqCounts[freq]++;
                    freqCounts[newFreq]--;
                    if (freqCounts[newFreq] == 0) freqCounts.erase(newFreq);
                }
            }
            return false;
        };
        
        return backtrack(0);
    }
};
