class Solution {
  int reversePairs(List<int> nums) {
    List<int> sortCount(List<int> arr) {
      int n = arr.length;
      if (n <= 1) {
        return <int>[...arr, 0];
      }

      int mid = n ~/ 2;
      List<int> leftRes = sortCount(arr.sublist(0, mid));
      List<int> rightRes = sortCount(arr.sublist(mid));

      List<int> left = leftRes.sublist(0, leftRes.length - 1);
      int leftCount = leftRes.last;
      List<int> right = rightRes.sublist(0, rightRes.length - 1);
      int rightCount = rightRes.last;

      int count = leftCount + rightCount;

      int j = 0;
      for (int x in left) {
        while (j < right.length && x > 2 * right[j]) {
          j++;
        }
        count += j;
      }

      List<int> merged = [];
      int i = 0;
      j = 0;
      while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
          merged.add(left[i]);
          i++;
        } else {
          merged.add(right[j]);
          j++;
        }
      }

      if (i < left.length) {
        merged.addAll(left.sublist(i));
      }
      if (j < right.length) {
        merged.addAll(right.sublist(j));
      }

      merged.add(count);
      return merged;
    }

    List<int> result = sortCount(nums);
    return result.last;
  }
}
