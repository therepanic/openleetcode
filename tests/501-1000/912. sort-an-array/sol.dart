class Solution {
  void merge(List<int> nums, int l, int mid, int r) {
    List<int> a = [];
    List<int> b = [];
    for (int i = l; i <= mid; i++) {
      a.add(nums[i]);
    }
    for (int j = mid + 1; j <= r; j++) {
      b.add(nums[j]);
    }
    int i = 0, j = 0, k = l;
    while (k <= r) {
      if (j == b.length) {
        nums[k] = a[i];
        i++;
      } else if (i == a.length) {
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

  void mergesort(List<int> nums, int l, int r) {
    if (l >= r) return;
    int mid = (l + r) ~/ 2;
    mergesort(nums, l, mid);
    mergesort(nums, mid + 1, r);
    merge(nums, l, mid, r);
  }

  List<int> sortArray(List<int> nums) {
    mergesort(nums, 0, nums.length - 1);
    return nums;
  }
}
