function queryString(s: string, n: number): boolean {
  for (let num = n; num >= 1; num--) {
    const target = num.toString(2);
    const length = target.length;
    let left = 0;
    let valid = false;
    for (let right = 0; right < s.length; right++) {
      while (right - left + 1 > length) {
        left++;
      }
      if (s.substring(left, right + 1) === target) {
        valid = true;
        break;
      }
    }
    if (!valid) {
      return false;
    }
  }
  return true;
}
