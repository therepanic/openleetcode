class Solution:
    def largestMultipleOfThree(self, digits):
        counts = [0] * 10
        for digit in digits:
            counts[digit] += 1

        remainder = sum(digit * counts[digit] for digit in range(10)) % 3

        def remove_smallest(group, amount):
            for digit in group:
                while amount and counts[digit]:
                    counts[digit] -= 1
                    amount -= 1
            return amount == 0

        if remainder == 1:
            if not remove_smallest((1, 4, 7), 1):
                remove_smallest((2, 5, 8), 2)
        elif remainder == 2:
            if not remove_smallest((2, 5, 8), 1):
                remove_smallest((1, 4, 7), 2)

        result = "".join(str(digit) * counts[digit] for digit in range(9, -1, -1))
        return "0" if result.startswith("0") else result
