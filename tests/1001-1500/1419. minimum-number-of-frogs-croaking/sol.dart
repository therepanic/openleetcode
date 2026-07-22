class Solution {
  int minNumberOfFrogs(String croakOfFrogs) {
    int maxi = 0;
    int curr = 0;
    int c = 0, r = 0, o = 0, a = 0, k = 0;
    for (var ch in croakOfFrogs.split('')) {
      if (ch == 'c') {
        c++;
        curr++;
      } else if (ch == 'r') {
        r++;
      } else if (ch == 'o') {
        o++;
      } else if (ch == 'a') {
        a++;
      } else if (ch == 'k') {
        k++;
        curr--;
      }
      maxi = maxi > curr ? maxi : curr;
      if (c < r || r < o || o < a || a < k) {
        return -1;
      }
    }
    if (curr == 0 && c == r && r == o && o == a && a == k) {
      return maxi;
    } else {
      return -1;
    }
  }
}
