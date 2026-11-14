class Solution(object):
    def possiblyEquals(self, s1, s2):
        """
        :type s1: str
        :type s2: str
        :rtype: bool
        """
        mem = {}
        # p1 is pointer to s1 for next character to process
        # and p2 is pointer to s2 for next character to process
        # diff is the number of characters to match in s1 - 
        # number of characters to match in s2
        # if s1 has digits x, then s2 has x more characters to match, 
        # decrement diff by x
        # if s2 has digits x, then s1 has x more characters to match, 
        # increment diff by x
        # diff is positive if s1 has more unmatched characters
        # diff is negative if s2 has more unmatched characters
        # if diff is 0, s1 and s2 are matched so far 
        def dfs(p1, p2, diff):
            if (p1, p2, diff) in mem:
                return mem[(p1,p2,diff)]
            #print("compare s1:"+ s1[p1:] + " s2:" + s2[p2:] + " diff:" + str(diff))
            # base cases
            if p1 == len(s1) and diff > 0: 
                mem[(p1, p2, diff)] = False
                return False 
            if p2 == len(s2) and diff < 0: 
                mem[(p1, p2, diff)] = False
                return False
            if p1 > len(s1) or p2 > len(s2): 
                #assert("index out of range")
                mem[(p1, p2, diff)] = False
                return False
            
            # non digit case: diff > 0
            if diff > 0: 
                # move p1 to catch up and reduce diff
                if p1 < len(s1): 
                    if not s1[p1].isdigit(): 
                        return dfs(p1+1, p2, diff-1)
            
            # non digit case: diff < 0
            if diff < 0: 
                # move p2 to catch up and increase diff
                if p2  < len(s2):
                    if not s2[p2].isdigit():
                        return dfs(p1, p2+1, diff+1)

            # digit case: s1
            if p1 < len(s1) and s1[p1].isdigit():
                n = 0
                t = p1
                while t < len(s1) and s1[t].isdigit():
                    n = n*10 + int(s1[t])
                    t += 1
                    if dfs(t, p2, diff-n):
                        return True
                mem[(p1, p2, diff)] = False
                return False

            # digit case: s2
            if p2 < len(s2) and s2[p2].isdigit():
                n = 0
                t = p2
                while t < len(s2) and s2[t].isdigit():
                    n = n*10 + int(s2[t])
                    t += 1
                    if dfs(p1, t, diff+n):
                        return True
                mem[(p1, p2, diff)] = False
                return False

            # non digit case: both p1 and p2 are letters
            if p1 < len(s1) and p2 < len(s2) and s1[p1] != s2[p2]: 
                mem[(p1, p2, diff)] = False
                return False
            if dfs(p1+1, p2+1, diff):
                return True 

            # non digit base case
            result = ( diff == 0 and p1 == len(s1) and p2 == len(s2))
            mem[(p1, p2, diff)] = result
            return result
        
        return dfs(0,0,0)