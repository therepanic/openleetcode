function isVowel(c: string): boolean {
  return c === "a" || c === "e" || c === "i" || c === "o" || c === "u";
}

function maxVowels(s: string, k: number): number {
  let maxVowel = 0;
  let left = 0;
  let vowel = 0;

  for (let right = 0; right < s.length; right++) {
    if (isVowel(s[right])) {
      vowel++;
    }

    if (right - left + 1 === k) {
      maxVowel = Math.max(maxVowel, vowel);
      if (isVowel(s[left])) {
        vowel--;
      }
      left++;
    }
  }

  return maxVowel;
}
