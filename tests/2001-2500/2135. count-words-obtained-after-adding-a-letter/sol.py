from collections import Counter

class Solution:
    def wordCount(self, startWords: List[str], targetWords: List[str]) -> int:
        store = set()
        for w in startWords:
            store.add(''.join(sorted(list(w))))
        
        answer = 0

        for t in targetWords:
            counts = Counter(t)
            sorti = ''.join(sorted(list(t)))
            for i in range(len(sorti)):
                if counts[sorti[i]] == 1:
                    new = sorti[:i] + sorti[i+1:]
                    if new in store:
                        answer += 1
                        break

        return answer