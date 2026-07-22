function smallestSufficientTeam(
  req_skills: string[],
  people: string[][],
): number[] {
  const n = people.length;
  let peopleSets: Set<string>[] = people.map((p) => new Set(p));

  // Remove all skill sets that are subset of another skillset
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (i !== j) {
        let isSubset = true;
        for (const s of peopleSets[i]) {
          if (!peopleSets[j].has(s)) {
            isSubset = false;
            break;
          }
        }
        if (isSubset) {
          peopleSets[i] = new Set();
        }
      }
    }
  }

  // Build dictionary of skills to the people who can perform them
  const skillsToPeople: Map<string, Set<number>> = new Map();
  for (let i = 0; i < n; i++) {
    for (const skill of peopleSets[i]) {
      if (!skillsToPeople.has(skill)) {
        skillsToPeople.set(skill, new Set());
      }
      skillsToPeople.get(skill)!.add(i);
    }
  }

  let unmetSkills: Set<string> = new Set(req_skills);
  let smallestLength: number = Infinity;
  let currentTeam: number[] = [];
  let bestTeam: number[] = [];

  function meetSkill(skill: number = 0): void {
    if (unmetSkills.size === 0) {
      if (smallestLength > currentTeam.length) {
        smallestLength = currentTeam.length;
        bestTeam = [...currentTeam];
      }
      return;
    }

    if (skill >= req_skills.length || !unmetSkills.has(req_skills[skill])) {
      meetSkill(skill + 1);
      return;
    }

    const candidates = skillsToPeople.get(req_skills[skill]);
    if (!candidates) return;

    for (const i of candidates) {
      const skillsAdded = new Set<string>();
      for (const s of peopleSets[i]) {
        if (unmetSkills.has(s)) {
          skillsAdded.add(s);
        }
      }

      for (const s of skillsAdded) {
        unmetSkills.delete(s);
      }
      currentTeam.push(i);

      meetSkill(skill + 1);

      currentTeam.pop();
      for (const s of skillsAdded) {
        unmetSkills.add(s);
      }
    }
  }

  meetSkill();
  return bestTeam;
}
