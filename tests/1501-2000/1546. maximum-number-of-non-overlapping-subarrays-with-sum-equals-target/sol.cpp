class Solution {
public:
    int maxNonOverlapping(vector<int>& nums, int target) {
        int num_of_subarrays = 0;
        int temp = 0;
        unordered_set<int> visited = {0};
        for (int num : nums) {
            temp += num;
            int prev = temp - target;
            if (visited.count(prev)) {
                visited.clear();
                num_of_subarrays++;
            }
            visited.insert(temp);
        }
        return num_of_subarrays;
    }
};
