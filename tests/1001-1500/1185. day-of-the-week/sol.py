class Solution:
    def dayOfTheWeek(self, day: int, month: int, year: int) -> str:
        days = {
            # 01.01.1971 is Friday
            1: "Friday",
            2: "Saturday",
            3: "Sunday",
            4: "Monday",
            5: "Tuesday",
            6: "Wednesday",
            0: "Thursday",
        }

        leap_years = set([i for i in range(1960, 2100, 4)])
        years_days = {i: 365 if i not in leap_years else 366 for i in range(1960, 2101)}
        months_days = {
            1: 31,
            2: 28 if year not in leap_years else 29,
            3: 31,
            4: 30,
            5: 31,
            6: 30,
            7: 31,
            8: 31,
            9: 30,
            10: 31,
            11: 30,
            12: 31,
        }

        result_days = 0
        for y in range(1971, year):
            result_days += years_days[y]

        for m in range(1, month):
            result_days += months_days[m]
        result_days += day

        return days[result_days % 7]
