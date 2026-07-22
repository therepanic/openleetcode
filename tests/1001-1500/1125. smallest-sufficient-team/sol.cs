public class Solution {
    private HashSet<string> unmetSkills;
    private int smallestLength = int.MaxValue;
    private List<int> currentTeam = new List<int>();
    private List<int> bestTeam = new List<int>();
    private string[] reqSkills;
    private List<HashSet<string>> peopleSets;
    private Dictionary<string, HashSet<int>> skillsToPeople;

    public int[] SmallestSufficientTeam(string[] req_skills, IList<IList<string>> people) {
        reqSkills = req_skills;
        int n = people.Count;
        peopleSets = new List<HashSet<string>>();
        for (int i = 0; i < n; i++) {
            peopleSets.Add(new HashSet<string>(people[i]));
        }

        // Remove all skill sets that are subset of another skillset
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j && peopleSets[i].IsSubsetOf(peopleSets[j])) {
                    peopleSets[i] = new HashSet<string>();
                }
            }
        }

        // Build dictionary of skills to the people who can perform them
        skillsToPeople = new Dictionary<string, HashSet<int>>();
        for (int i = 0; i < n; i++) {
            foreach (string skill in peopleSets[i]) {
                if (!skillsToPeople.ContainsKey(skill)) {
                    skillsToPeople[skill] = new HashSet<int>();
                }
                skillsToPeople[skill].Add(i);
            }
        }

        unmetSkills = new HashSet<string>(req_skills);

        MeetSkill(0);

        return bestTeam.ToArray();
    }

    private void MeetSkill(int skill) {
        if (unmetSkills.Count == 0) {
            if (smallestLength > currentTeam.Count) {
                smallestLength = currentTeam.Count;
                bestTeam = new List<int>(currentTeam);
            }
            return;
        }

        if (skill >= reqSkills.Length || !unmetSkills.Contains(reqSkills[skill])) {
            MeetSkill(skill + 1);
            return;
        }

        if (!skillsToPeople.ContainsKey(reqSkills[skill])) return;

        foreach (int i in skillsToPeople[reqSkills[skill]]) {
            HashSet<string> skillsAdded = new HashSet<string>(peopleSets[i]);
            skillsAdded.IntersectWith(unmetSkills);

            unmetSkills.ExceptWith(skillsAdded);
            currentTeam.Add(i);

            MeetSkill(skill + 1);

            currentTeam.RemoveAt(currentTeam.Count - 1);
            unmetSkills.UnionWith(skillsAdded);
        }
    }
}
