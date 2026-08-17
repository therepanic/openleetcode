import math


class Solution(object):
    def minSpeedOnTime(self, dist, hour):
        """
        :type dist: List[int]
        :type hour: float
        :rtype: int
        """
        if not dist:
            return -1

        # helper function to check if a particular speed helps to reach destination on time
        def check(dist, hour, speed):
            total_time, i = 0, 0
            while i < (len(dist) - 1):
                total_time = total_time + math.ceil(dist[i] / float(speed))
                i = i + 1
            total_time = total_time + (dist[len(dist) - 1] / float(speed))
            return total_time <= hour

        low_speed, high_speed, answer = 1, pow(10, 7), -1

        while low_speed <= high_speed:
            mid_speed = (low_speed + high_speed) // 2
            if check(dist, hour, mid_speed):
                answer = mid_speed
                high_speed = mid_speed - 1
            else:
                low_speed = mid_speed + 1

        return answer
