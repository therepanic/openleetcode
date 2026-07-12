function spellchecker(wordlist: string[], queries: string[]): string[] {
  const exact = new Set(wordlist);
  const caseMap = new Map<string, string>();
  const vowelMap = new Map<string, string>();

  for (const w of wordlist) {
    const lower = w.toLowerCase();
    const devowel = deVowel(lower);
    if (!caseMap.has(lower)) {
      caseMap.set(lower, w);
    }
    if (!vowelMap.has(devowel)) {
      vowelMap.set(devowel, w);
    }
  }

  return queries.map((q) => {
    if (exact.has(q)) {
      return q;
    } else {
      const lower = q.toLowerCase();
      const devowel = deVowel(lower);
      if (caseMap.has(lower)) {
        return caseMap.get(lower)!;
      } else if (vowelMap.has(devowel)) {
        return vowelMap.get(devowel)!;
      } else {
        return "";
      }
    }
  });
}

function deVowel(s: string): string {
  return s
    .split("")
    .map((c) => ("aeiou".includes(c) ? "*" : c))
    .join("");
}
