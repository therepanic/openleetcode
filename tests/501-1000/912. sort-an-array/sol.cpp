class Solution {
private:
    void merge(vector<int>& nums, int l, int mid, int r) {
        vector<int> a, b;
        for (int i = l; i <= mid; i++) {
            a.push_back(nums[i]);
        }
        for (int j = mid + 1; j <= r; j++) {
            b.push_back(nums[j]);
        }
        int i = 0, j = 0, k = l;
        while (k <= r) {
            if (j == b.size()) {
                nums[k] = a[i];
                i++;
            } else if (i == a.size()) {
                nums[k] = b[j];
                j++;
            } else if (a[i] <= b[j]) {
                nums[k] = a[i];
                i++;
            } else {
                nums[k] = b[j];
                j++;
            }
            k++;
        }
    }

    void mergesort(vector<int>& nums, int l, int r) {
        if (l >= r) return;
        int mid = (l + r) / 2;
        mergesort(nums, l, mid);
        mergesort(nums, mid + 1, r);
        merge(nums, l, mid, r);
    }

public:
    vector<int> sortArray(vector<int>& nums) {
        mergesort(nums, 0, nums.size() - 1);
        return nums;
    }
};
