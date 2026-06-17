function palindromePairs(words: string[]): number[][] {
    const ans: number[][] = [];
    const wordMap: Map<string, number> = new Map();
    for (let i = 0; i < words.length; i++) {
        wordMap.set(words[i].split('').reverse().join(''), i);
    }

    if (wordMap.has("")) {
        const emptyIdx = wordMap.get("")!;
        for (let i = 0; i < words.length; i++) {
            if (words[i] !== "" && isPalindrome(words[i])) {
                ans.push([i, emptyIdx]);
            }
        }
    }

    for (let i = 0; i < words.length; i++) {
        const word = words[i];
        for (let j = 0; j < word.length; j++) {
            const left = word.substring(0, j + 1);
            const right = word.substring(j + 1);
            if (wordMap.has(left) && isPalindrome(right) && wordMap.get(left) !== i) {
                ans.push([i, wordMap.get(left)!]);
            }
            if (wordMap.has(right) && isPalindrome(left) && wordMap.get(right) !== i) {
                ans.push([wordMap.get(right)!, i]);
            }
        }
    }
    return ans;
}

function isPalindrome(s: string): boolean {
    return s === s.split('').reverse().join('');
}
