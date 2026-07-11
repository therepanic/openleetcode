class Solution {
  List<int> smallestSufficientTeam(List<String> req_skills, List<List<String>> people) {
    int n = req_skills.length;
    int m = people.length;
    
    Map<String, int> skillIdx = {};
    for (int i = 0; i < n; i++) {
      skillIdx[req_skills[i]] = i;
    }
    
    List<int> peopleMask = List.filled(m, 0);
    for (int i = 0; i < m; i++) {
      int mask = 0;
      for (String skill in people[i]) {
        mask |= (1 << skillIdx[skill]!);
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
    
    List<List<int>> skillToPeople = List.generate(n, (_) => []);
    for (int i = 0; i < m; i++) {
      if (peopleMask[i] == 0) continue;
      for (int bit = 0; bit < n; bit++) {
        if ((peopleMask[i] & (1 << bit)) != 0) {
          skillToPeople[bit].add(i);
        }
      }
    }
    
    Set<String> unmetSkills = req_skills.toSet();
    int smallestLength = 1 << 60;
    List<int> currentTeam = [];
    List<int> bestTeam = [];
    
    void backtrack(int skill) {
      if (unmetSkills.isEmpty) {
        if (smallestLength > currentTeam.length) {
          smallestLength = currentTeam.length;
          bestTeam = List.from(currentTeam);
        }
        return;
      }
      
      if (skill >= n) return;
      
      if (!unmetSkills.contains(req_skills[skill])) {
        backtrack(skill + 1);
        return;
      }
      
      for (int i in skillToPeople[skill]) {
        int mask = peopleMask[i];
        Set<String> skillsAdded = {};
        for (String s in unmetSkills) {
          if ((mask & (1 << skillIdx[s]!)) != 0) {
            skillsAdded.add(s);
          }
        }
        if (skillsAdded.isEmpty) continue;
        
        unmetSkills.removeAll(skillsAdded);
        currentTeam.add(i);
        
        backtrack(skill + 1);
        
        currentTeam.removeLast();
        unmetSkills.addAll(skillsAdded);
      }
    }
    
    backtrack(0);
    return bestTeam;
  }
}
