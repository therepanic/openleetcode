class Solution {
  List<int> xorQueries(List<int> arr, List<List<int>> queries) {
    int n = arr.length;
    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] ^ arr[i];
    }
    return queries.map((q) => prefix[q[1] + 1] ^ prefix[q[0]]).toList();
  }
}
