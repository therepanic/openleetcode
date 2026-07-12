class Solution {
  int subarrayBitwiseORs(List<int> arr) {
    Set<int> resultOrs = {};
    Set<int> currentOrs = {};
    
    for (int x in arr) {
      Set<int> nextOrs = {};
      for (int y in currentOrs) {
        nextOrs.add(x | y);
      }
      nextOrs.add(x);
      resultOrs.addAll(nextOrs);
      currentOrs = nextOrs;
    }
    
    return resultOrs.length;
  }
}
