class Solution {
  List<List<int>> intervalIntersection(List<List<int>> firstList, List<List<int>> secondList) {
    if (firstList.isEmpty || secondList.isEmpty) {
      return [];
    }
    
    int n = firstList.length, m = secondList.length;
    List<List<int>> res = [];
    int i = 0, j = 0;
    
    while (i < n && j < m) {
      int s1 = firstList[i][0], e1 = firstList[i][1];
      int s2 = secondList[j][0], e2 = secondList[j][1];
      
      if (e1 >= s2 && s1 <= e2) {
        int start = s1 > s2 ? s1 : s2;
        int end = e1 < e2 ? e1 : e2;
        res.add([start, end]);
      }
      
      if (e1 > e2) {
        j++;
      } else {
        i++;
      }
    }
    
    return res;
  }
}
