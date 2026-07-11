public class Solution {
    private void Merge(int[] nums, int l, int mid, int r) {
        int[] a = new int[mid - l + 1];
        int[] b = new int[r - mid];
        for (int i = l; i <= mid; i++) {
            a[i - l] = nums[i];
        }
        for (int j = mid + 1; j <= r; j++) {
            b[j - mid - 1] = nums[j];
        }
        int iIdx = 0, jIdx = 0, k = l;
        while (k <= r) {
            if (jIdx == b.Length) {
                nums[k] = a[iIdx];
                iIdx++;
            } else if (iIdx == a.Length) {
                nums[k] = b[jIdx];
                jIdx++;
            } else if (a[iIdx] <= b[jIdx]) {
                nums[k] = a[iIdx];
                iIdx++;
            } else {
                nums[k] = b[jIdx];
                jIdx++;
            }
            k++;
        }
    }

    private void Mergesort(int[] nums, int l, int r) {
        if (l >= r) return;
        int mid = (l + r) / 2;
        Mergesort(nums, l, mid);
        Mergesort(nums, mid + 1, r);
        Merge(nums, l, mid, r);
    }

    public int[] SortArray(int[] nums) {
        Mergesort(nums, 0, nums.Length - 1);
        return nums;
    }
}
