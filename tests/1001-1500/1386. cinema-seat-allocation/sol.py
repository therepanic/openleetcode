from collections import defaultdict


class Solution:
    def maxNumberOfFamilies(self, n: int, reservedSeats: List[List[int]]) -> int:
        row_seats = defaultdict(set)

        for row, seat in reservedSeats:
            row_seats[row].add(seat)

        # all the empty rows are available so start your answer with those
        ans = (n - len(row_seats)) * 2

        # iterate over the row_seats that were allocated
        for row, seats in row_seats.items():
            available = 0
            # chech non overlapping two seats first
            option1 = {2, 3, 4, 5}
            option2 = {6, 7, 8, 9}
            if option1.isdisjoint(seats):
                available += 1
            if option2.isdisjoint(seats):
                available += 1

            option3 = {4, 5, 6, 7}  # if in the middle
            if option3.isdisjoint(seats):
                available = max(available, 1)

            ans += available

        return ans
