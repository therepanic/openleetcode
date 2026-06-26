class Solution {
  List<int> smallestRange(List<List<int>> nums) {
    final values = <List<int>>[];
    for (int i = 0; i < nums.length; i++) {
      for (final value in nums[i]) {
        values.add([value, i]);
      }
    }
    values.sort((a, b) => a[0] != b[0] ? a[0].compareTo(b[0]) : a[1].compareTo(b[1]));

    final freq = <int, int>{};
    int covered = 0;
    int left = 0;
    int bestLeft = values.first[0];
    int bestRight = values.last[0];

    for (int right = 0; right < values.length; right++) {
      final listIdx = values[right][1];
      if ((freq[listIdx] ?? 0) == 0) {
        covered++;
      }
      freq[listIdx] = (freq[listIdx] ?? 0) + 1;

      while (covered == nums.length) {
        final currentLeft = values[left][0];
        final currentRight = values[right][0];
        if (currentRight - currentLeft < bestRight - bestLeft ||
            (currentRight - currentLeft == bestRight - bestLeft && currentLeft < bestLeft)) {
          bestLeft = currentLeft;
          bestRight = currentRight;
        }
        final leftList = values[left][1];
        freq[leftList] = freq[leftList]! - 1;
        if (freq[leftList] == 0) {
          covered--;
        }
        left++;
      }
    }
    return [bestLeft, bestRight];
  }
}
