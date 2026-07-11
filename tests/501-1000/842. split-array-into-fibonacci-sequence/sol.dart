class Solution {
  List<int> splitIntoFibonacci(String num) {
    bool invalid(String x) {
      if (x[0] == '0' && x.length > 1) return true;
      if (x.length > 10) return true;
      return int.parse(x) >= 2147483648;
    }
    
    List<int> check(String a0, String a1, String num) {
      int i = 0;
      List<int> ret = [int.parse(a0), int.parse(a1)];
      String curA0 = a0, curA1 = a1;
      while (i < num.length) {
        int a0Val = int.parse(curA0);
        int a1Val = int.parse(curA1);
        String res = (a0Val + a1Val).toString();
        int j = 0;
        while (i < num.length && j < res.length && res[j] == num[i]) {
          j++;
          i++;
        }
        if (j < res.length || invalid(res)) return [];
        curA0 = curA1;
        curA1 = res;
        ret.add(int.parse(res));
      }
      return ret;
    }
    
    int n = num.length;
    for (int j = 1; j < n - 1; j++) {
      for (int i = 0; i < j; i++) {
        String a0 = num.substring(0, i + 1);
        String a1 = num.substring(i + 1, j + 1);
        if (invalid(a0) || invalid(a1)) continue;
        List<int> ret = check(a0, a1, num.substring(j + 1));
        if (ret.isNotEmpty) return ret;
      }
    }
    return [];
  }
}
