class Solution {
public:
    int subarraysDivByK(vector<int>& nums, int k) {
        int s = 0;
        int res = 0;
        unordered_map<int, int> hs;
        hs[0] = 1;
        for (int num : nums) {
            s += num;
            int rem = s % k;
            if (rem < 0) rem += k;
            res += hs[rem];
            hs[rem]++;
        }
        return res;
    }
};
