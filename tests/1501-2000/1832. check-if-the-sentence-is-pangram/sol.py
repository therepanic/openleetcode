class Solution(object):
    def checkIfPangram(self, sentence: str) -> bool:
        if len(sentence) < 26:
            return False

        for i in range(26):
            if chr(97 + i) not in sentence:
                return False
        return True
