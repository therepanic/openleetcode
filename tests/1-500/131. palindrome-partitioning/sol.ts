function partition(s: string): string[][] {
  const result: string[][] = [];
  const path: string[] = [];
  const isPalindrome = (leftStart: number, rightStart: number): boolean => {
    let left = leftStart;
    let right = rightStart;
    while (left < right) if (s[left++] !== s[right--]) return false;
    return true;
  };
  const backtrack = (index: number): void => {
    if (index === s.length) {
      result.push(path.slice());
      return;
    }
    for (let end = index; end < s.length; end++) {
      if (isPalindrome(index, end)) {
        path.push(s.slice(index, end + 1));
        backtrack(end + 1);
        path.pop();
      }
    }
  };
  backtrack(0);
  return result;
}
