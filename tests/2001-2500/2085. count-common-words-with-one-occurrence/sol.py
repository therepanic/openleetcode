class Solution(object):
    def countWords(self, words1, words2):
        c=0
        for i in words1:
            if words1.count(i)==1:
                if words2.count(i)==1:
                    c+=1
        return c