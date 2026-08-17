class Solution:
    def maximumNumber(self, num: str, change: List[int]) -> str:
        a = list(num)
        flag = False
        for i in range(len(a)):
            b = int(a[i])
            if b < change[b]:
                a[i] = str(change[b])
                flag = True
            elif b == change[b] or not flag:
                continue
            else:
                break
        return "".join(a)
