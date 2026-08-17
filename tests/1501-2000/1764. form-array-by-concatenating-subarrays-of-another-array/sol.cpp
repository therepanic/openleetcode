class Solution {
public:
    bool canChoose(vector<vector<int>>& groups, vector<int>& nums) {
        int i = 0;
        for (auto& group : groups) {
            bool found = false;
            while (i + group.size() <= nums.size()) {
                bool match = true;
                for (int j = 0; j < group.size(); j++) {
                    if (nums[i + j] != group[j]) {
                        match = false;
                        break;
                    }
                }
                if (match) {
                    i += group.size();
                    found = true;
                    break;
                } else {
                    i++;
                }
            }
            if (!found) return false;
        }
        return true;
    }
};
