class Solution {
public:
    int tupleSameProduct(vector<int>& nums) {
        unordered_map<int, int> productCount;
        int ans = 0;

        for (int i = 0; i < nums.size(); i++) {
            for (int j = i+1; j < nums.size(); j++) {
                int product = nums[i] * nums[j];
                ans += 8 * productCount[product];
                productCount[product]++;
            }
        }

        return ans;
    }
};
