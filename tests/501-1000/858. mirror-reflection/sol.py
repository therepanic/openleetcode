class Solution(object):
    def mirrorReflection(self, p, q):
        """
        :type p: int
        :type q: int
        :rtype: int
        """
        result = -1
        i = 1
        height = 0
        while result != 0 or result != 1 or result != 2:
            height += q
            if height % p == 0:
                if (height / p) % 2 == 0:
                    result = 0
                    break
                if i % 2 == 0:
                    result = 2
                    break
                result = 1
                break
            i += 1
        return result
