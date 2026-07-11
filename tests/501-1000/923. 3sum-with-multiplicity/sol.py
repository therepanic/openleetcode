from collections import Counter
from typing import List


class Solution:
    def threeSumMulti(self, arr: List[int], target: int) -> int:
        arr.sort()
        cnt = Counter(arr)  # obtain the number of instances of each number
        res, i, l = 0, 0, len(arr)

        while (
            i < l
        ):  # in replacement of the for-loop, so that we can increment i by more than 1
            j, k = (
                i,
                l - 1,
            )  # j should be the leftmost index, hence j=i instead of j=i+1

            while j < k:  # i <= j < k; arr[i] <= arr[j] <= arr[k]
                if arr[i] + arr[j] + arr[k] < target:
                    j += cnt[arr[j]]
                elif arr[i] + arr[j] + arr[k] > target:
                    k -= cnt[arr[k]]

                else:  # arr[i] + arr[j] + arr[k] == target
                    if (
                        arr[i] != arr[j] != arr[k]
                    ):  # Case 1: All the numbers are different
                        res += cnt[arr[i]] * cnt[arr[j]] * cnt[arr[k]]
                    elif (
                        arr[i] == arr[j] != arr[k]
                    ):  # Case 2: The smaller two numbers are the same
                        res += (
                            cnt[arr[i]] * (cnt[arr[i]] - 1) * cnt[arr[k]] // 2
                        )  # math.comb(cnt[arr[i]], 2) * cnt[arr[k]]
                    elif (
                        arr[i] != arr[j] == arr[k]
                    ):  # Case 3: The larger two numbers are the same
                        res += (
                            cnt[arr[i]] * cnt[arr[j]] * (cnt[arr[j]] - 1) // 2
                        )  # math.comb(cnt[arr[j]], 2) * cnt[arr[i]]
                    else:  # Case 4: All the numbers are the same
                        res += (
                            cnt[arr[i]] * (cnt[arr[i]] - 1) * (cnt[arr[i]] - 2) // 6
                        )  # math.comb(cnt[arr[i]], 3)
                    # Shift pointers by the number of instances of the number
                    j += cnt[arr[j]]
                    k -= cnt[arr[k]]

            i += cnt[arr[i]]  # Shift pointer by the number of instances of the number

        return res % int(1e9 + 7)
