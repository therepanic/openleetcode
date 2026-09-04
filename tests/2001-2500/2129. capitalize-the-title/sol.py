class Solution:
    def capitalizeTitle(self, title):
        words = title.split()
        for i in range(len(words)):
            word_len = len(words[i])
            
            if word_len <= 2:
                words[i] = words[i].lower()
            else:
                words[i] = words[i].capitalize()
        
        return " ".join(words)