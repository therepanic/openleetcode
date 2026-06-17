class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        words = s.split(" ")
        if len(pattern) != len(words):
            return False
        
        return len(set(pattern)) == len(set(words)) == len(set(zip(pattern, words)))