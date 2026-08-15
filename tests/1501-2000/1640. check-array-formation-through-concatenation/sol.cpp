class Solution {
public:
    bool canFormArray(vector<int>& arr, vector<vector<int>>& pieces) {
        vector<int> a;
        vector<vector<int>> remaining = pieces;
        for (int i : arr) {
            for (int j = 0; j < remaining.size(); j++) {
                if (find(remaining[j].begin(), remaining[j].end(), i) != remaining[j].end()) {
                    a.insert(a.end(), remaining[j].begin(), remaining[j].end());
                    remaining.erase(remaining.begin() + j);
                    break;
                }
            }
        }
        return a == arr;
    }
};
