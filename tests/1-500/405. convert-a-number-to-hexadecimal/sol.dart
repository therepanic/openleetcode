class Solution {
  String toHex(int num) {
    if (num == 0) return "0";
    int n = num;
    if (n < 0) n += 4294967296;
    String h = "0123456789abcdef";
    List<String> r = [];
    while (n > 0) {
      r.add(h[n & 15]);
      n ~/= 16;
    }
    return r.reversed.join();
  }
}
