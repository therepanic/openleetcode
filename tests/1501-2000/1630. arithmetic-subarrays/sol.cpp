class Solution {
public:
    vector<bool> checkArithmeticSubarrays(vector<int>& nums, vector<int>& l, vector<int>& r) {
        vector<bool> ans;
        for (int i = 0; i < l.size(); i++) {
            vector<int> sub(nums.begin()+l[i], nums.begin()+r[i]+1);
            sort(sub.begin(), sub.end());
            bool valid = true;
            if (sub.size() > 2) {
                int d = sub[1] - sub[0];
                for (int j = 1; j < sub.size()-1; j++) {
                    if (sub[j+1] - sub[j] != d) {
                        valid = false;
                        break;
                    }
                }
            }
            ans.push_back(valid);
        }
        return ans;
    }
};
