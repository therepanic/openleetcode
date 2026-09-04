class Solution:
    def smallestSubsequence(self, s: str, k: int, letter: str, repetition: int) -> str:
        counts,total = 0, 0
        n = len(s)
        for ch in s:
            if ch==letter:
                total +=1
        stack = []
        occ = 0
        for idx,ch in enumerate(s):
            if ch==letter:
                counts +=1
            while stack and stack[-1]>ch and  len(stack)+ (n-1-idx)>=k and (occ+total-counts-(stack[-1]==letter)+(ch==letter)>=repetition ): 
                occ -= stack.pop()==letter
            if ch!=letter  and len(stack)< k-max(0,(repetition-occ)):
                stack.append(ch)
            elif ch==letter and len(stack)+(total-counts)<k:
                stack.append(ch)
                occ +=1
        return ''.join(stack)