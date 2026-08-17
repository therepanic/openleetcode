function numDifferentIntegers(word: string): number {
  let i = 0;
  const n = word.length;
  const st = new Set<string>();
  while (i < n) {
    while (i < n && /[a-zA-Z]/.test(word[i])) {
      i++;
    }
    let tempInt = "";
    while (i < n && /[0-9]/.test(word[i])) {
      tempInt += word[i];
      i++;
    }
    let j = 0;
    while (j + 1 < tempInt.length && tempInt[j] === "0") {
      j++;
    }
    const k = tempInt.substring(j);
    if (k !== "") {
      st.add(k);
    }
  }
  return st.size;
}
