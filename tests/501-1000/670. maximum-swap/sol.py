class Solution(object):
    def maximumSwap(self, num):
        num_list = list(str(num))
        last_index = {int(d): i for i, d in enumerate(num_list)}
        for i, d in enumerate(num_list):
            for x in range(9, int(d), -1):
                if x in last_index and last_index[x] > i:
                    num_list[i], num_list[last_index[x]] = (
                        num_list[last_index[x]],
                        num_list[i],
                    )
                    return int("".join(num_list))
        return num
