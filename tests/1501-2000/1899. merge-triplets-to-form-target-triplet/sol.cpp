class Solution {
public:
    bool mergeTriplets(vector<vector<int>>& triplets, vector<int>& target) {
        for (auto& t : triplets) {
            if (t == target) {
                return true;
            }
        }
        vector<int> curr = {0, 0, 0};
        for (auto& t : triplets) {
            bool flag = false;
            if (target[0] == t[0] && curr[0] != target[0]) {
                flag = true;
            }
            if (target[1] == t[1] && curr[1] != target[1]) {
                flag = true;
            }
            if (target[2] == t[2] && curr[2] != target[2]) {
                flag = true;
            }
            if (flag) {
                vector<int> temp = curr;
                curr = {
                    max(curr[0], t[0]),
                    max(curr[1], t[1]),
                    max(curr[2], t[2])
                };
                if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
                    curr = temp;
                }
            }
        }
        return curr == target;
    }
};
