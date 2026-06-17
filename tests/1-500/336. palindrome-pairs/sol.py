class Solution:
    def isPalindrome(self, s: str) -> bool:
        return s == s[::-1]
    
    def palindromePairs(self, words: List[str]) -> List[List[int]]:
        ans = []
        word_map = {}
        
        # Store reversed words with their indices
        for i, word in enumerate(words):
            word_map[word[::-1]] = i
        
        # Handle empty string case
        if "" in word_map:
            empty_idx = word_map[""]
            for i, word in enumerate(words):
                if word != "" and self.isPalindrome(word):
                    ans.append([i, empty_idx])
        
        # Check all splits of each word
        for i, word in enumerate(words):
            for j in range(len(word)):
                left = word[:j + 1]
                right = word[j + 1:]
                
                if left in word_map and self.isPalindrome(right) and word_map[left] != i:
                    ans.append([i, word_map[left]])
                
                if right in word_map and self.isPalindrome(left) and word_map[right] != i:
                    ans.append([word_map[right], i])
        
        return ans