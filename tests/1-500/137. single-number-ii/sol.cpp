class Solution {
public:
    int singleNumber(vector<int>& nums) {
        long long total_sum = 0;
        unordered_set<int> seen;
        for (int num : nums) {
            total_sum += num;
            seen.insert(num);
        }
        long long unique_sum = 0;
        for (int num : seen) {
            unique_sum += num;
        }
        long long numerator = 3 * unique_sum - total_sum;
        return static_cast<int>(numerator >> 1);
    }
};
