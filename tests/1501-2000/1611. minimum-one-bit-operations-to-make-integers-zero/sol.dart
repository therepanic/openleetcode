class Solution {
  int minimumOneBitOperations(int n) {
    int highest = 0;
    for (int i = 0; i < 32; i++) {
      if ((n & (1 << i)) != 0) {
        highest = i;
      }
    }

    int ans = 0;
    bool add = true;
    for (int i = highest; i >= 0; i--) {
      if ((n & (1 << i)) != 0) {
        int val = (1 << (i + 1)) - 1;
        if (add) {
          ans += val;
        } else {
          ans -= val;
        }
        add = !add;
      }
    }

    return ans;
  }
}
