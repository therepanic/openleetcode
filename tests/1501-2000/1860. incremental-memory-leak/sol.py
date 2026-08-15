class Solution(object):
    def memLeak(self, memory1, memory2):
        """
        :type memory1: int
        :type memory2: int
        :rtype: List[int]
        """
        time = 1
        while True:
            if memory1 >= memory2:
                if memory1 >= time:
                    memory1 -= time
                else:
                    break
            else:
                if memory2 >= time:
                    memory2 -= time
                else:
                    break
            time += 1
        return [time, memory1, memory2]
