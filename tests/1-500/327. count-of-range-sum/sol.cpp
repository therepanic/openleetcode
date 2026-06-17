class Solution {
public:
    int countRangeSum(vector<int>& nums, int lower, int upper) {
        vector<long long> psum = {0};
        for (int num : nums) {
            psum.push_back(psum.back() + num);
        }

        vector<long long> slist;
        int result = 0;
        for (auto it = psum.rbegin(); it != psum.rend(); ++it) {
            long long pval = *it;
            long long lo = pval + lower;
            long long hi = pval + upper;

            int left = lower_bound(slist.begin(), slist.end(), lo) - slist.begin();
            int right = upper_bound(slist.begin(), slist.end(), hi) - slist.begin();
            result += right - left;

            int idx = lower_bound(slist.begin(), slist.end(), pval) - slist.begin();
            slist.insert(slist.begin() + idx, pval);
        }

        return result;
    }
};
