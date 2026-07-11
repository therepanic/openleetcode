public class Solution {
    public int[] SmallestSufficientTeam(string[] req_skills, IList<IList<string>> people) {
        int n = req_skills.Length;
        int m = people.Count;
        
        Dictionary<string, int> skillIdx = new Dictionary<string, int>();
        for (int i = 0; i < n; i++) {
            skillIdx[req_skills[i]] = i;
        }
        
        int[] peopleMask = new int[m];
        for (int i = 0; i < m; i++) {
            int mask = 0;
            foreach (string skill in people[i]) {
                mask |= 1 << skillIdx[skill];
            }
            peopleMask[i] = mask;
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < m; j++) {
                if (i != j && peopleMask[i] != 0 && (peopleMask[i] & peopleMask[j]) == peopleMask[i]) {
                    peopleMask[i] = 0;
                    break;
                }
            }
        }
        
        List<int>[] skillToPeople = new List<int>[n];
        for (int i = 0; i < n; i++) {
            skillToPeople[i] = new List<int>();
        }
        for (int i = 0; i < m; i++) {
            if (peopleMask[i] == 0) continue;
            for (int bit = 0; bit < n; bit++) {
                if ((peopleMask[i] & (1 << bit)) != 0) {
                    skillToPeople[bit].Add(i);
                }
            }
        }
        
        HashSet<string> unmetSkills = new HashSet<string>(req_skills);
        int smallestLength = int.MaxValue;
        List<int> currentTeam = new List<int>();
        List<int> bestTeam = new List<int>();
        
        void Backtrack(int skill) {
            if (unmetSkills.Count == 0) {
                if (smallestLength > currentTeam.Count) {
                    smallestLength = currentTeam.Count;
                    bestTeam = new List<int>(currentTeam);
                }
                return;
            }
            
            if (skill >= n) return;
            
            if (!unmetSkills.Contains(req_skills[skill])) {
                Backtrack(skill + 1);
                return;
            }
            
            foreach (int i in skillToPeople[skill]) {
                int mask = peopleMask[i];
                List<string> skillsAdded = new List<string>();
                foreach (string s in unmetSkills) {
                    if ((mask & (1 << skillIdx[s])) != 0) {
                        skillsAdded.Add(s);
                    }
                }
                if (skillsAdded.Count == 0) continue;
                
                foreach (string s in skillsAdded) unmetSkills.Remove(s);
                currentTeam.Add(i);
                
                Backtrack(skill + 1);
                
                currentTeam.RemoveAt(currentTeam.Count - 1);
                foreach (string s in skillsAdded) unmetSkills.Add(s);
            }
        }
        
        Backtrack(0);
        return bestTeam.ToArray();
    }
}
