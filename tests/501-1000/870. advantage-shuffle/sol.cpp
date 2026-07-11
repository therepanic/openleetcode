class Solution {
public:
    vector<int> advantageCount(vector<int>& nums1, vector<int>& nums2) {
        int n = nums1.size();
        sort(nums1.begin(), nums1.end());
        
        vector<pair<int, int>> nums2Sorted;
        for (int i = 0; i < n; i++) {
            nums2Sorted.push_back({nums2[i], i});
        }
        sort(nums2Sorted.begin(), nums2Sorted.end());
        
        vector<int> res(n);
        int left = 0, right = n - 1;
        for (int i = n - 1; i >= 0; i--) {
            if (nums1[right] > nums2Sorted[i].first) {
                res[nums2Sorted[i].second] = nums1[right];
                right--;
            } else {
                res[nums2Sorted[i].second] = nums1[left];
                left++;
            }
        }
        
        return res;
    }
};
