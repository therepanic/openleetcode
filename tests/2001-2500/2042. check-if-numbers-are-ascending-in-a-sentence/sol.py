class Solution:
    def areNumbersAscending(self, s: str) -> bool:
        s = s.split(" ")
        count = -1
        for i in s:
            if i.isdigit():
                if count == int(i):
                    return False
                elif count > int(i):
                    return False
                else:
                    count = int(i)
        return True