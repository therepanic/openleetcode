function maxCompatibilitySum(
  students: number[][],
  mentors: number[][],
): number {
  const m = students.length;
  let maxScore = 0;
  const perm: number[] = Array.from({ length: m }, (_, i) => i);
  do {
    let total = 0;
    for (let i = 0; i < m; i++) {
      for (let j = 0; j < students[i].length; j++) {
        if (students[i][j] === mentors[perm[i]][j]) total++;
      }
    }
    maxScore = Math.max(maxScore, total);
  } while (nextPermutation(perm));
  return maxScore;
}

function nextPermutation(a: number[]): boolean {
  const n = a.length;
  let i = n - 2;
  while (i >= 0 && a[i] >= a[i + 1]) i--;
  if (i < 0) return false;
  let j = n - 1;
  while (a[j] <= a[i]) j--;
  [a[i], a[j]] = [a[j], a[i]];
  let l = i + 1,
    r = n - 1;
  while (l < r) {
    [a[l], a[r]] = [a[r], a[l]];
    l++;
    r--;
  }
  return true;
}
