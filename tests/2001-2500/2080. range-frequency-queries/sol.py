class Solution:
    class RangeFreqQuery(object):
        def __init__(self, arr):
            """
            :type arr: List[int]
            """
            self.pos = {}
            for i, num in enumerate(arr):
                if num not in self.pos:
                    self.pos[num] = []
                self.pos[num].append(i)

        def query(self, left, right, value):
            """
            :type left: int
            :type right: int
            :type value: int
            :rtype: int
            """
            if value not in self.pos:
                return 0

            indices = self.pos[value]

            l = bisect.bisect_left(indices, left)
            r = bisect.bisect_right(indices, right)

            return r - l

    # Your RangeFreqQuery object will be instantiated and called as such:
    # obj = RangeFreqQuery(arr)
    # param_1 = obj.query(left,right,value)
