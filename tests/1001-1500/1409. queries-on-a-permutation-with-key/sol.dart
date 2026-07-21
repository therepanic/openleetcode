class Solution {
  List<int> processQueries(List<int> queries, int m) {
    List<int> ans = [];
    List<int> arr = List.generate(m, (i) => i + 1);
    for (int x in queries) {
      int idx = arr.indexOf(x);
      ans.add(idx);
      arr.removeAt(idx);
      arr.insert(0, x);
    }
    return ans;
  }
}
