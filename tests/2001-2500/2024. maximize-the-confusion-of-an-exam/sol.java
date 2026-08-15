class Solution {
    public int maxConsecutiveAnswers(String answerKey, int k) {
        int l = 0;
        int r = 0;
        int falseCnt = 0;
        int trueCnt = 0;
        int result = 0;
        int n = answerKey.length();
        while (r < n) {
            if (answerKey.charAt(r) == 'T') {
                trueCnt++;
            }
            if (answerKey.charAt(r) == 'F') {
                falseCnt++;
            }
            while (trueCnt > k && falseCnt > k) {
                if (answerKey.charAt(l) == 'T') {
                    trueCnt--;
                }
                if (answerKey.charAt(l) == 'F') {
                    falseCnt--;
                }
                l++;
            }
            result = Math.max(result, r - l + 1);
            r++;
        }
        return result;
    }
}
