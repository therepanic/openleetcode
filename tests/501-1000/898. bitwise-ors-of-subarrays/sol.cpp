class Solution {
public:
    int subarrayBitwiseORs(vector<int>& arr) {
        unordered_set<int> result_ors;
        unordered_set<int> current_ors;
        
        for (int x : arr) {
            unordered_set<int> next_ors;
            for (int y : current_ors) {
                next_ors.insert(x | y);
            }
            next_ors.insert(x);
            result_ors.insert(next_ors.begin(), next_ors.end());
            current_ors = next_ors;
        }
        
        return result_ors.size();
    }
};
