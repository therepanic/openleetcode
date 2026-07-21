class Solution:
    def comb(self, i, words, freq, score, ans, total):

        if i == len(words):
            ans[0] = max(ans[0], total)
            return

        same = freq[:]
        rem = total
        full = True

        for ch in words[i]:
            if freq[ord(ch) - ord("a")] == 0:
                full = False
                break
            else:
                freq[ord(ch) - ord("a")] -= 1
                total += score[ord(ch) - ord("a")]

        if full:
            self.comb(i + 1, words, freq, score, ans, total)
            self.comb(i + 1, words, same, score, ans, rem)
        else:
            self.comb(i + 1, words, same, score, ans, rem)

    def maxScoreWords(self, words, letters, score):

        freq = [0] * 26
        for c in letters:
            if isinstance(c, bool):
                c = "t" if c else "f"
            freq[ord(c) - ord("a")] += 1

        ans = [0]

        self.comb(0, words, freq, score, ans, 0)

        return ans[0]
