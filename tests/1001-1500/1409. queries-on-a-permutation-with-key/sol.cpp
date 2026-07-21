class Solution {
public:
    vector<int> processQueries(vector<int>& queries, int m) {
        vector<int> ans;
        vector<int> arr;
        for (int i = 1; i <= m; i++) {
            arr.push_back(i);
        }
        for (int x : queries) {
            int idx = -1;
            for (int j = 0; j < arr.size(); j++) {
                if (arr[j] == x) {
                    idx = j;
                    break;
                }
            }
            ans.push_back(idx);
            arr.erase(arr.begin() + idx);
            arr.insert(arr.begin(), x);
        }
        return ans;
    }
};
