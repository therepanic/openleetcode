function nextGreatestLetter(letters: string[], target: string): string {
  let res: string = letters[0];
  let flag: boolean = false;

  for (const ch of letters) {
    if (!flag) {
      if (ch > target) {
        res = ch;
        flag = !flag;
      }
    } else {
      if (ch > target && ch < res) {
        res = ch;
      }
    }
  }

  return res;
}
