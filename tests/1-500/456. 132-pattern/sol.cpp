class Solution {
public:
    bool find132pattern(vector<int>& nums) {
        vector<pair<int, int>> st;
        int cur_min = nums[0];

        for (int i = 1; i < nums.size(); i++) {
            int n = nums[i];
            while (!st.empty() && n >= st.back().first) {
                st.pop_back();
            }
            
            if (!st.empty() && n > st.back().second) {
                return true;
            }
            
            st.push_back({n, cur_min});
            cur_min = min(cur_min, n);
        }
        
        return false;
    }
};
