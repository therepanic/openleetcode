class Solution:
    def getWinner(self, arr: List[int], k: int) -> int:

        # ----------------------------------------------
        candidate = arr[0]
        streak = 0
        for el in arr[1:]:
            if candidate > el:
                streak += 1
            else:
                candidate = el
                streak = 1

            if streak == k:
                return candidate
        return candidate  # at last
        # ----------------------------------------------

        # same using maxi----------------------------------------------
        maxi = max(arr)
        candidate = arr[0]
        streak = 0
        for el in arr[1:]:
            if candidate > el:
                streak += 1
            else:
                candidate = el
                streak = 1

            if streak == k or candidate == maxi:  # if candidate==maxi till then
                return candidate

        # ----------------------------------------------

        n = len(arr)

        k = min(
            k, n - 1
        )  # k can be very large so no use,, ,keep it smakl till max maybe len of array
        # Maximum element reaches the front in at most (n-1) rounds.
        # After that it wins forever, so cap k to (n-1).

        # --------------------------------------------------------------------------
        # what was i doing in first try was right but gave TLE
        """
        count = 0
        candidate = None

        # while count<k:
        #     bigger = max(arr[0], arr[1])
        #     smaller = min(arr[0], arr[1])

        #     if candidate == bigger:
        #         count+=1
        #     else: # candidate ==None or candidate!=bigger:
        #         candidate = bigger 
        #         count = 1
            
        #     arr = [bigger] + arr[2:] + [smaller]   # TLE ❌ this shit gonna give TLE 
        #     # print(f"{arr=}, {candidate=}, {count=}")   #NICE

        #     if count==k: return candidate
        """
        # --------------------------------------------------------------------------
        # using deque....,, and deque's appendleft(bigger)
        # --------------------------------------------------------------------------
        count = 0
        candidate = None

        q = deque(arr)

        while count < k:
            a, b = q.popleft(), q.popleft()
            bigger = max(a, b)
            smaller = min(a, b)

            if candidate == bigger:
                count += 1
            else:
                candidate = bigger
                count = 1

            q.appendleft(bigger)  # 💎💎✅NICCCCEEE  deque's appendleft(bigger) 💎✅
            q.append(smaller)

            if count == k:
                return candidate
        # return -1 #NEVER RUNS


# --------------------------------------------------------------------------
