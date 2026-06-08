class Solution {
public:
    string getPermutation(int n, int k) {
        vector<int> nums;
        vector<int> factorial(n + 1, 1);
        for (int i = 1; i <= n; i++) {
            nums.push_back(i);
            factorial[i] = factorial[i - 1] * i;
        }

        k--;
        string res;
        for (int remaining = n; remaining >= 1; remaining--) {
            int block = factorial[remaining - 1];
            int idx = k / block;
            k %= block;
            res += to_string(nums[idx]);
            nums.erase(nums.begin() + idx);
        }
        return res;
    }
};
