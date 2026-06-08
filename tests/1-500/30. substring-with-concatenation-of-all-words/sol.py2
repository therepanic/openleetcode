from collections import Counter, defaultdict

class Solution:
    def findSubstring(self, s, words):
        if not s or not words:
            return []

        word_len = len(words[0])
        word_count = len(words)
        target = Counter(words)
        ans = []

        for offset in range(word_len):
            left = offset
            right = offset
            window = defaultdict(int)
            used = 0

            while right + word_len <= len(s):
                word = s[right:right + word_len]
                right += word_len

                if word in target:
                    window[word] += 1
                    used += 1
                    while window[word] > target[word]:
                        left_word = s[left:left + word_len]
                        window[left_word] -= 1
                        left += word_len
                        used -= 1
                    if used == word_count:
                        ans.append(left)
                        left_word = s[left:left + word_len]
                        window[left_word] -= 1
                        left += word_len
                        used -= 1
                else:
                    window.clear()
                    used = 0
                    left = right

        return ans
