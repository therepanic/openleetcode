class Solution:
    def reorderedPowerOf2(self, n: int) -> bool:
        signatures = [
            3,
            5,
            11,
            23,
            51,
            35,
            187,
            345,
            1105,
            195,
            330,
            2530,
            10846,
            10005,
            90321,
            260015,
            341887,
            11970,
            154275,
            1891175,
            6374082,
            1074450,
            1621158,
            66602158,
            89201295,
            35070035,
            191712774,
            143849475,
            4757357605,
            588153930,
            632937690,
        ]

        primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

        def get_sign(num):
            return 1 if num == 0 else primes[num % 10] * get_sign(num // 10)

        target_sign = get_sign(n)
        return target_sign in signatures
