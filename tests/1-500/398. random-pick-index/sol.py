import random


class Solution(object):
    def __init__(self, nums):
        self.d = {}
        for i, v in enumerate(nums):
            self.d.setdefault(v, []).append(i)

    def pick(self, target):
        return random.choice(self.d[target])
