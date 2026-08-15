class Solution:
    MOD = 10**9 + 7

    def countGoodNumbers(self, n: int) -> int:
        chakra_length = n
        even_positions = (chakra_length + 1) // 2
        odd_positions = chakra_length // 2

        even_ways = self.chakra_power(5, even_positions)
        odd_ways = self.chakra_power(4, odd_positions)

        return (even_ways * odd_ways) % self.MOD

    def chakra_power(self, base, power):
        result = 1
        base %= self.MOD

        while power > 0:
            if power % 2 == 1:
                result = (result * base) % self.MOD
            base = (base * base) % self.MOD
            power //= 2

        return result
