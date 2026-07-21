class Solution:
    def rankTeams(self, votes):
        teams = votes[0]
        positions = {team: [0] * len(teams) for team in teams}
        for vote in votes:
            for index, team in enumerate(vote):
                positions[team][index] += 1
        return "".join(
            sorted(
                teams,
                key=lambda team: tuple(
                    [-count for count in positions[team]] + [ord(team)]
                ),
            )
        )
