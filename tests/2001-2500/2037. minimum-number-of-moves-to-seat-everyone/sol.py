class Solution:
    def minMovesToSeat(self, seats: List[int], students: List[int]) -> int:
        seats.sort()
        students.sort()
        ans=0
        for i in range(len(seats)):
            ans+=abs(seats[i]-students[i])
        return ans