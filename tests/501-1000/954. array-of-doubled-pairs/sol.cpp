class Solution {
public:
    bool canReorderDoubled(vector<int>& arr) {
        unordered_map<int, int> freq;
        for (int i : arr) {
            freq[i]++;
        }
        
        sort(arr.begin(), arr.end(), [](int a, int b) {
            return abs(a) < abs(b);
        });
        
        for (int val : arr) {
            if (freq[val] == 0) continue;
            int target = val * 2;
            if (freq.count(target) && freq[target] > 0) {
                freq[val]--;
                freq[target]--;
            } else {
                return false;
            }
        }
        return true;
    }
};
