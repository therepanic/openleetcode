class Solution {
public:
    bool canBeEqual(vector<int>& target, vector<int>& arr) {
        vector<int> counts(1001, 0);
        
        for (int i = 0; i < target.size(); i++) {
            counts[target[i]]++;
            counts[arr[i]]--;
        }
        
        for (int c : counts) {
            if (c != 0) return false;
        }
        return true;
    }
};
