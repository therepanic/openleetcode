class Solution {
  List<List<int>> kSmallestPairs(List<int> nums1, List<int> nums2, int k) {
    List<List<int>> result = [];
    if (nums1.isEmpty || nums2.isEmpty) {
      return result;
    }

    final h = <List<int>>[
      [nums1[0] + nums2[0], 0, 0],
    ];
    Set<String> visited = {};
    visited.add("0,0");

    while (h.isNotEmpty && result.length < k) {
      h.sort((a, b) {
        var cmp = a[0].compareTo(b[0]);
        if (cmp != 0) return cmp;
        cmp = a[1].compareTo(b[1]);
        if (cmp != 0) return cmp;
        return a[2].compareTo(b[2]);
      });
      var cur = h.removeAt(0);
      int i = cur[1], j = cur[2];
      result.add([nums1[i], nums2[j]]);

      if (j + 1 < nums2.length && !visited.contains("$i,${j + 1}")) {
        visited.add("$i,${j + 1}");
        h.add([nums1[i] + nums2[j + 1], i, j + 1]);
      }

      if (i + 1 < nums1.length && !visited.contains("${i + 1},$j")) {
        visited.add("${i + 1},$j");
        h.add([nums1[i + 1] + nums2[j], i + 1, j]);
      }
    }

    return result;
  }
}
