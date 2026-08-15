class Solution:
    def longestObstacleCourseAtEachPosition(self, obstacles: list[int]) -> list[int]:
        from bisect import bisect_right

        tails = []
        answer = []
        for height in obstacles:
            index = bisect_right(tails, height)
            if index == len(tails):
                tails.append(height)
            else:
                tails[index] = height
            answer.append(index + 1)
        return answer
