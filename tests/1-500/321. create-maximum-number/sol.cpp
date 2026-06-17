class Solution {
public:
    vector<int> maxNumber(vector<int>& nums1, vector<int>& nums2, int k) {
        vector<int> ans;
        int m = nums1.size(), n = nums2.size();
        int start = max(0, k - n);
        int end = min(m, k);
        for (int i = start; i <= end; i++) {
            vector<int> sub1 = getMaxSubsequence(nums1, i);
            vector<int> sub2 = getMaxSubsequence(nums2, k - i);
            vector<int> merged = merge(sub1, sub2);
            if (greater(merged, 0, ans, 0)) {
                ans = merged;
            }
        }
        return ans;
    }

private:
    vector<int> getMaxSubsequence(vector<int>& nums, int q) {
        vector<int> stack;
        int maxDrop = nums.size() - q;
        for (int num : nums) {
            while (maxDrop > 0 && !stack.empty() && stack.back() < num) {
                stack.pop_back();
                maxDrop--;
            }
            if (stack.size() < q) {
                stack.push_back(num);
            } else {
                maxDrop--;
            }
        }
        return stack;
    }

    vector<int> merge(vector<int>& a, vector<int>& b) {
        vector<int> output;
        int i = 0, j = 0;
        while (i < a.size() || j < b.size()) {
            if (greater(a, i, b, j)) {
                output.push_back(a[i++]);
            } else {
                output.push_back(b[j++]);
            }
        }
        return output;
    }

    bool greater(vector<int>& a, int i, vector<int>& b, int j) {
        while (i < a.size() && j < b.size() && a[i] == b[j]) {
            i++;
            j++;
        }
        if (j == b.size()) return true;
        if (i < a.size() && a[i] > b[j]) return true;
        return false;
    }
};
