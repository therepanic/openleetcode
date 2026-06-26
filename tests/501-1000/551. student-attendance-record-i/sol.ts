function checkRecord(s: string): boolean {
  let aCount = 0;
  let lStreak = 0;

  for (const c of s) {
    if (c === "A") {
      aCount++;
      if (aCount >= 2) {
        return false;
      }
    }
    if (c === "L") {
      lStreak++;
      if (lStreak >= 3) {
        return false;
      }
    } else {
      lStreak = 0;
    }
  }

  return true;
}
