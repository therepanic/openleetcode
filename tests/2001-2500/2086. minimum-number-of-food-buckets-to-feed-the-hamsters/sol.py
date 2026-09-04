class Solution(object):
    def minimumBuckets(self, hamsters):
        """
        :type hamsters: str
        :rtype: int
        """
        n = len(hamsters)
        start = 0
        if hamsters == "" or hamsters[:2] == "HH" or hamsters[n-2:] == "HH" or "HHH" in hamsters or hamsters == "H":
            return -1
        return hamsters.count("H") - hamsters.count("H.H")