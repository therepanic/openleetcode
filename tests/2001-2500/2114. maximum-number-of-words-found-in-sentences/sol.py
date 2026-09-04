class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        total = 0
        for ele in sentences:
            if len(ele.split())>total:
                total = len(ele.split())
                
        return total