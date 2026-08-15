class Solution {
  int maxConsecutiveAnswers(String answerKey, int k) {
    int l = 0;
    int r = 0;
    int falseCnt = 0;
    int trueCnt = 0;
    int result = 0;
    int n = answerKey.length;
    while (r < n) {
      if (answerKey[r] == 'T') {
        trueCnt++;
      }
      if (answerKey[r] == 'F') {
        falseCnt++;
      }
      while (trueCnt > k && falseCnt > k) {
        if (answerKey[l] == 'T') {
          trueCnt--;
        }
        if (answerKey[l] == 'F') {
          falseCnt--;
        }
        l++;
      }
      result = result > (r - l + 1) ? result : (r - l + 1);
      r++;
    }
    return result;
  }
}
