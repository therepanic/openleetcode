class Solution {
public:
    vector<int> countSmaller(vector<int>& nums) {
        vector<int> sortedList;
        vector<int> ans;
        for (int i = nums.size() - 1; i >= 0; i--) {
            int n = nums[i];
            int idx = bisectLeft(sortedList, n);
            ans.push_back(idx);
            sortedList.insert(sortedList.begin() + idx, n);
        }
        reverse(ans.begin(), ans.end());
        return ans;
    }
    
private:
    int bisectLeft(vector<int>& list, int target) {
        int lo = 0, hi = list.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list[mid] >= target) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
};
