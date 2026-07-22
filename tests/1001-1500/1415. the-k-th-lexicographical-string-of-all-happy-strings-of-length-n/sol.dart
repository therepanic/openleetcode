class Solution {
  String getHappyString(int n, int k) {
    int total = 3 * (1 << (n - 1));
    if (k > total) {
      return "";
    }
    
    k -= 1;
    StringBuffer result = StringBuffer();
    String last = "";
    
    for (int pos = 0; pos < n; pos++) {
      int branch = 1 << (n - pos - 1);
      List<String> choices = [];
      for (String c in ["a", "b", "c"]) {
        if (c != last) {
          choices.add(c);
        }
      }
      
      int idx = k ~/ branch;
      result.write(choices[idx]);
      
      last = choices[idx];
      k %= branch;
    }
    
    return result.toString();
  }
}
