class Solution {
public:
    vector<int> findOriginalArray(vector<int>& changed) {
        if (changed.size() % 2 != 0) return {};
        
        unordered_map<int, int> count;
        for (int num : changed) {
            count[num]++;
        }
        sort(changed.begin(), changed.end());
        vector<int> original;
        
        for (int num : changed) {
            if (count[num] == 0) continue;
            if (count[2 * num] == 0) return {};
            original.push_back(num);
            count[num]--;
            count[2 * num]--;
        }
        
        return original;
    }
};
