class Solution:
    def reversePrefix(self, word: str, ch: str) -> str:
        if ch not in word:
            return word

        stack = []
        answer = []

        for i, c in enumerate(word):
            stack.append(c)

            if c == ch:
                answer.extend(reversed(stack))
                answer.extend(word[i + 1 :])
                break

        return "".join(answer)
