function maxConsecutiveAnswers(answerKey: string, k: number): number {
  let l = 0;
  let r = 0;
  let falseCnt = 0;
  let trueCnt = 0;
  let result = 0;
  const n = answerKey.length;
  while (r < n) {
    if (answerKey[r] === "T") {
      trueCnt++;
    }
    if (answerKey[r] === "F") {
      falseCnt++;
    }
    while (trueCnt > k && falseCnt > k) {
      if (answerKey[l] === "T") {
        trueCnt--;
      }
      if (answerKey[l] === "F") {
        falseCnt--;
      }
      l++;
    }
    result = Math.max(result, r - l + 1);
    r++;
  }
  return result;
}
