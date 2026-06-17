class Solution:
    def removeInvalidParentheses(self, s: str) -> List[str]:
        def isValid(s):
            i= 0
            ctr = 0
            while i<len(s):
                if s[i]== '(':
                    ctr += 1
                elif s[i] == ")":
                    if ctr == 0:
                        return False
                    ctr -= 1
                
                i +=1
            
            return ctr == 0
        
        level ={s}
        while True:
            valid = list(filter(isValid, level))
            if valid:
                return valid
            level = {s[:i] + s[i+1:] for i in range(len(s)) for s in level}