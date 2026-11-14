class Solution(object):
    def findEvenNumbers(self, digits):
        mpp = [0]*10
        for d in digits:
            mpp[d] += 1
        res = []
        for i in range(1, 10):
            if mpp[i] == 0: continue
            mpp[i] -= 1
            for j in range(10):
                if mpp[j] == 0: continue
                mpp[j] -= 1
                for k in range(0, 10, 2):
                    if mpp[k] == 0: continue
                    res.append(i*100 + j*10 + k)
                mpp[j] += 1
            mpp[i] += 1
        return res