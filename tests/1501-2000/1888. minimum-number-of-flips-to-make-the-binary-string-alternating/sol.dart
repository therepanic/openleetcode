class Solution {
  int minFlips(String s) {
    int n = s.length;
    String t = s + s;
    int ans = n;
    int mis0 = 0;

    for (int i = 0; i < 2 * n; i++) {
      String expected0 = i % 2 == 0 ? '0' : '1';
      if (t[i] != expected0) {
        mis0++;
      }

      if (i >= n) {
        int left = i - n;
        String expLeft = left % 2 == 0 ? '0' : '1';
        if (t[left] != expLeft) {
          mis0--;
        }
      }

      if (i >= n - 1) {
        int mis1 = n - mis0;
        ans = (ans < mis0 ? ans : mis0) < mis1 ? (ans < mis0 ? ans : mis0) : mis1;
        // simpler: ans = min(ans, min(mis0, mis1));
      }
    }

    return ans;
  }
}
