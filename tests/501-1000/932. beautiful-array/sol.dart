class Solution {
  List<int> beautifulArray(int n) {
    if (n == 1) {
      return [1];
    }
    
    List<int> left = beautifulArray((n + 1) ~/ 2);
    List<int> right = beautifulArray(n ~/ 2);
    
    List<int> result = [];
    
    for (int x in left) {
      result.add(2 * x - 1);
    }
    for (int x in right) {
      result.add(2 * x);
    }
    
    return result;
  }
}
