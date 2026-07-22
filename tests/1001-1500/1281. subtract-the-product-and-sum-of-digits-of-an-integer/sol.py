class Solution:
    def subtractProductAndSum(self, n: int) -> int:
        sum_digits = 0
        product_digits = 1

        while n > 0:
            digit = n % 10
            sum_digits += digit
            product_digits *= digit
            n //= 10

        return product_digits - sum_digits
