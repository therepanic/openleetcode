function alphabetBoardPath(target: string): string {
  const arr: number[][] = [
    [0, 1, 2, 3, 4],
    [5, 6, 7, 8, 9],
    [10, 11, 12, 13, 14],
    [15, 16, 17, 18, 19],
    [20, 21, 22, 23, 24],
    [25],
  ];
  const word: number[] = target.split("").map((c) => c.charCodeAt(0) - 97);
  let s: string = "";
  let j: number = 0,
    k: number = 0;
  if (word[0] % 5 != 0) {
    s += "D".repeat((word[0] / 5) | 0);
  } else {
    s += "D".repeat((word[0] / 5) | 0);
  }
  if (word[0] % 5 >= 0) {
    s += "R".repeat(word[0] % 5);
  }
  s += "!";
  for (let i = 1; i < word.length; i++) {
    for (let h = 0; h < arr.length; h++) {
      for (let l = 0; l < arr[h].length; l++) {
        if (arr[h][l] == word[i - 1]) j = h;
        if (arr[h][l] == word[i]) k = h;
      }
    }
    if (word[i - 1] == 25) {
      if (j > k) {
        s += "U".repeat(j - k);
      } else {
        s += "D".repeat(k - j);
      }
      if (word[i] % 5 >= word[i - 1] % 5) {
        s += "R".repeat((word[i] % 5) - (word[i - 1] % 5));
      } else {
        s += "L".repeat((word[i - 1] % 5) - (word[i] % 5));
      }
    } else {
      if (word[i] % 5 >= word[i - 1] % 5) {
        s += "R".repeat((word[i] % 5) - (word[i - 1] % 5));
      } else {
        s += "L".repeat((word[i - 1] % 5) - (word[i] % 5));
      }
      if (j > k) {
        s += "U".repeat(j - k);
      } else {
        s += "D".repeat(k - j);
      }
    }
    s += "!";
  }
  return s;
}
