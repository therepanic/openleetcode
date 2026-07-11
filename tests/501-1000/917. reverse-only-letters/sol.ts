function reverseOnlyLetters(s: string): string {
  const chars = s.split("");
  let start = 0;
  let end = chars.length - 1;
  while (true) {
    if (start >= end) {
      break;
    }

    const startIsLetter = /[a-zA-Z]/.test(chars[start]);
    const endIsLetter = /[a-zA-Z]/.test(chars[end]);

    if (startIsLetter && endIsLetter) {
      const temp = chars[start];
      chars[start] = chars[end];
      chars[end] = temp;
      start++;
      end--;
    } else if (!startIsLetter) {
      start++;
    } else {
      end--;
    }
  }

  return chars.join("");
}
