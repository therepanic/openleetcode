class Solution:
    def kthDistinct(self, arr, k):
        n=len(arr)
        vec=[]
        for i in range(n):
            t=0
            for j in range(n):
                if i!=j and arr[i]==arr[j]:
                    break
                elif i!=j and arr[i]!=arr[j]:
                    t+=1
            if t==n-1:
                vec.append(arr[i])
        if len(vec) <= k-1:
            return ""
        return vec[k-1]