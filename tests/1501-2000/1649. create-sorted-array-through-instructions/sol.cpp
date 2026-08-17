class Solution {
private:
    vector<int> nums;
    vector<vector<int>> ans;
    
public:
    int createSortedArray(vector<int>& instructions) {
        int n = instructions.size();
        nums = instructions;
        ans = vector<vector<int>>(n, vector<int>(2, 0));
        
        vector<int> arr(n);
        for (int i = 0; i < n; i++) arr[i] = i;
        
        split(0, n - 1, arr);
        
        long long real_ans = 0;
        for (int i = 0; i < n; i++) {
            real_ans += min(ans[i][0], ans[i][1]);
        }
        return real_ans % 1000000007;
    }
    
    vector<int> merge(vector<int>& left, vector<int>& right) {
        int l = left.size() - 1;
        int r = right.size() - 1;
        while (l > -1 && r > -1) {
            if (nums[left[l]] <= nums[right[r]]) {
                ans[right[r]][1] += (left.size() - 1) - l;
                r--;
            } else {
                l--;
            }
        }
        while (r > -1) {
            ans[right[r]][1] += left.size();
            r--;
        }
        
        l = 0;
        r = 0;
        vector<int> res;
        while (l < left.size() && r < right.size()) {
            if (nums[left[l]] < nums[right[r]]) {
                res.push_back(left[l]);
                l++;
            } else {
                ans[right[r]][0] += l;
                res.push_back(right[r]);
                r++;
            }
        }
        while (r < right.size()) {
            ans[right[r]][0] += l;
            res.push_back(right[r]);
            r++;
        }
        while (l < left.size()) {
            res.push_back(left[l]);
            l++;
        }
        return res;
    }
    
    vector<int> split(int l, int r, vector<int>& arr) {
        if (l == r) {
            return {arr[r]};
        }
        int mid = (l + r) / 2;
        vector<int> left = split(l, mid, arr);
        vector<int> right = split(mid + 1, r, arr);
        return merge(left, right);
    }
};
