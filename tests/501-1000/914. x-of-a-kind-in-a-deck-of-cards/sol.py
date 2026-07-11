class Solution:
    def hasGroupsSizeX(self, deck: List[int]) -> bool:

        counts = {}
        for card in deck:
            if card in counts:
                counts[card] += 1
            else:
                counts[card] = 1

        def get_gcd(a: int, b: int) -> int:
            while b > 0:
                a, b = b, a % b
            return a

        frequencies = list(counts.values())
        current_gcd = frequencies[0]

        for count in frequencies[1:]:
            current_gcd = get_gcd(current_gcd, count)

            if current_gcd == 1:
                return False

        return current_gcd >= 2
