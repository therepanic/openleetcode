function checkIfCanBreak(s1: string, s2: string): boolean {
  let freq: number[] = new Array(26).fill(0);
  const n = s1.length;

  for (let ch of s1) {
    freq[ch.charCodeAt(0) - "a".charCodeAt(0)]++;
  }

  let temp1: string[] = [];

  for (let i = 25; i >= 0; i--) {
    while (freq[i] > 0) {
      temp1.push(String.fromCharCode("a".charCodeAt(0) + i));
      freq[i]--;
    }
  }

  freq = new Array(26).fill(0);

  for (let ch of s2) {
    freq[ch.charCodeAt(0) - "a".charCodeAt(0)]++;
  }

  let temp2: string[] = [];

  for (let i = 25; i >= 0; i--) {
    while (freq[i] > 0) {
      temp2.push(String.fromCharCode("a".charCodeAt(0) + i));
      freq[i]--;
    }
  }

  const sorted1 = temp1.join("");
  const sorted2 = temp2.join("");

  let all1 = true;
  let all2 = true;

  for (let i = 0; i < n; i++) {
    if (sorted1[i] < sorted2[i]) {
      all1 = false;
    }
    if (sorted2[i] < sorted1[i]) {
      all2 = false;
    }
  }

  return all1 || all2;
}
