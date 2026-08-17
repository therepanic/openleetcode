class Solution:
    def minMoves(self, nums, k: int) -> int:
        # we need k consecutive one
        # find the minimum number of swaps
        # to bring element at i to j
        # we need j-i swaps
        # what is the best pos for all to meet
        # it is the middle spot (median)
        # for all k size find median
        idx = []
        for i, val in enumerate(nums):
            if val == 1:
                idx.append(i)
        A = []
        for i, val in enumerate(idx):
            A.append(val - i)
        n = len(idx)
        l = 0
        prefix = [0] * (n)
        # prefix[0]=idx[0]
        # for i in range(1,n):
        #     prefix[i]=prefix[i-1]+idx[i]
        prefix[0] = A[0]
        for i in range(1, n):
            prefix[i] = prefix[i - 1] + A[i]

        def cost(l, r):
            mid = (l + r) >> 1
            # as point can between them
            if (r - l + 1) % 2 == 0:
                med = A[(l + r) >> 1]
            else:
                med = A[(l + r) >> 1]
            # this is trying to bring all to the med
            # so everything will be at median
            # but this is not we want the thing is we can k consecutive
            # and the k consecitve should have its med at med
            # so arrange accordingly
            # the (r-l+1)>>1 move to med
            # the (r-l+1)>>1-1 move to med-1
            # the (r-l+2)>>1-2 move to med-2
            # ...so one the (r-l+1)>>1-(r-l+1)>>1 element move to med-mid
            # so element are moved from med-mid to med+mid
            # this will be ok for odd elements then how for even elements ?
            # for even elements -> 1 2 3 4 -> 1 0 1 2 med-(mid-1) to med+mid so this ok??
            # can we gurantee that the med+mid and med-mid is always in the bounds yes the med is at the mid
            # val=(med*(mid-l+1)-(prefix[mid]-(prefix[l-1] if l>0 else 0)))+(prefix[r]-prefix[mid]-(med)*(r-mid)) this is wrong
            # what is the new fromula then ?
            # for one the extra (i-(mid)) will be added ig
            # the cost for left most element to move from l to (med-mid) is med-mid-l
            # the cost for left+1 element to move from l+1 to (med-mid+1) is med-mid+1-l-1 is med-mid-l
            # the cost for the new elements is suprisingly the same formula ? med-mid-i
            # the cost for right element from med+mid is r-(med+mid)
            # lets see it for the left side elements cost
            # we should move from idx[i] to idx[mid]+(i-mid) for i<=mid
            # so it will be idx[mid]+(i-mid)-idx[i]
            # simplyfy (idx[mid]-mid)-(idx[i]-i)
            # now for the right elements we should move to idx[mid]+(i-mid)
            # simplyfy similatly it is (idx[i]-i)-(idx[mid]-mid)
            # lets define A as idx[i]-i then the mid for this is idx[mid]-mid
            # for the A we can write med*(count)-pref[]
            return (
                med * (mid - l + 1) - (prefix[mid] - (prefix[l - 1] if l > 0 else 0))
            ) + (prefix[r] - prefix[mid] - (med) * (r - mid))

        ans = float("inf")
        for r in range(n):
            while r - l + 1 > k:
                l += 1
            if r - l + 1 == k:
                ans = min(ans, cost(l, r))
        return ans
