class Solution:
    def dayOfYear(self, date: str) -> int:
        date = date
        val = {
            1: 0,
            2: 31,
            3: 59,
            4: 90,
            5: 120,
            6: 151,
            7: 181,
            8: 212,
            9: 243,
            10: 273,
            11: 304,
            12: 334,
        }

        d = int(date[8:])
        m = int(date[5:7])
        y = int(date[0:4])
        is_leap = (y % 400 == 0) or (y % 4 == 0 and y % 100 != 0)
        if is_leap:
            for i in range(3, 13):
                val[i] += 1

        return d + val[m]
