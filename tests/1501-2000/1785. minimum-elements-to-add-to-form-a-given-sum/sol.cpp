class Solution {
public:
    int minElements(vector<int>& nums, int limit, int goal) {
        long long currentSum = 0;
        for (int num : nums) {
            currentSum += num;
        }
        long long diff = std::abs((long long)goal - currentSum);
        return (diff + limit - 1) / limit;
    }
};
