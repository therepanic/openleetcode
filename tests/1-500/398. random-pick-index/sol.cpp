class Solution {
private:
    unordered_map<int, vector<int>> map;
public:
    Solution(vector<int>& nums) {
        for (int i = 0; i < nums.size(); i++) {
            map[nums[i]].push_back(i);
        }
    }
    
    int pick(int target) {
        auto& indices = map[target];
        return indices[rand() % indices.size()];
    }
};
