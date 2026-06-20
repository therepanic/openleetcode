class Solution {
  String originalDigits(String s) {
    var c = Map<String, int>();
    for (var ch in s.split('')) {
      c[ch] = (c[ch] ?? 0) + 1;
    }
    var d = List.filled(10, 0);
    d[0] = c['z'] ?? 0;
    d[2] = c['w'] ?? 0;
    d[4] = c['u'] ?? 0;
    d[6] = c['x'] ?? 0;
    d[8] = c['g'] ?? 0;
    d[1] = (c['o'] ?? 0) - d[0] - d[2] - d[4];
    d[3] = (c['h'] ?? 0) - d[8];
    d[5] = (c['f'] ?? 0) - d[4];
    d[7] = (c['s'] ?? 0) - d[6];
    d[9] = (c['i'] ?? 0) - d[5] - d[6] - d[8];
    var sb = StringBuffer();
    for (int i = 0; i <= 9; i++) {
      sb.write(i.toString() * d[i]);
    }
    return sb.toString();
  }
}
