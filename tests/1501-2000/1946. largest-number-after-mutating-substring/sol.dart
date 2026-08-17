class Solution {
  String maximumNumber(String num, List<int> change) {
    List<String> a = num.split('');
    bool flag = false;
    for (int i = 0; i < a.length; i++) {
      int b = int.parse(a[i]);
      if (b < change[b]) {
        a[i] = change[b].toString();
        flag = true;
      } else if (b == change[b] || !flag) {
        continue;
      } else {
        break;
      }
    }
    return a.join();
  }
}
