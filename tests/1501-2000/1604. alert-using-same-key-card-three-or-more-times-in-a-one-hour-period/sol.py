class Solution(object):
    def alertNames(self, keyName, keyTime):
        """
        :type keyName: List[str]
        :type keyTime: List[str]
        :rtype: List[str]
        """

        def timeToMinutes(t):
            h, m = map(int, t.split(":"))
            return h * 60 + m

        name_to_times = defaultdict(list)

        for name, time in zip(keyName, keyTime):
            name_to_times[name].append(timeToMinutes(time))

        alerted = []

        for name, times in name_to_times.items():
            times.sort()
            for i in range(len(times) - 2):
                if times[i + 2] - times[i] <= 60:
                    alerted.append(name)
                    break

        return sorted(alerted)
