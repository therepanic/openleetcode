function isLongPressedName(name: string, typed: string): boolean {
  let i = 0;
  let j = 0;

  while (j < typed.length) {
    if (i < name.length && name[i] === typed[j]) {
      i++;
      j++;
    } else if (j > 0 && typed[j] === typed[j - 1]) {
      j++;
    } else {
      return false;
    }
  }

  return i === name.length;
}
