function smallestSufficientTeam(
  req_skills: string[],
  people: string[][],
): number[] {
  const n = req_skills.length;
  const m = people.length;

  const skillIdx: Map<string, number> = new Map();
  req_skills.forEach((skill, i) => skillIdx.set(skill, i));

  const peopleMask: number[] = new Array(m).fill(0);
  for (let i = 0; i < m; i++) {
    let mask = 0;
    for (const skill of people[i]) {
      mask |= 1 << skillIdx.get(skill)!;
    }
    peopleMask[i] = mask;
  }

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < m; j++) {
      if (
        i !== j &&
        peopleMask[i] !== 0 &&
        (peopleMask[i] & peopleMask[j]) === peopleMask[i]
      ) {
        peopleMask[i] = 0;
        break;
      }
    }
  }

  const skillToPeople: number[][] = Array.from({ length: n }, () => []);
  for (let i = 0; i < m; i++) {
    if (peopleMask[i] === 0) continue;
    for (let bit = 0; bit < n; bit++) {
      if ((peopleMask[i] & (1 << bit)) !== 0) {
        skillToPeople[bit].push(i);
      }
    }
  }

  const unmetSkills: Set<string> = new Set(req_skills);
  let smallestLength = Infinity;
  let currentTeam: number[] = [];
  let bestTeam: number[] = [];

  function backtrack(skill: number): void {
    if (unmetSkills.size === 0) {
      if (smallestLength > currentTeam.length) {
        smallestLength = currentTeam.length;
        bestTeam = [...currentTeam];
      }
      return;
    }

    if (skill >= n) return;

    if (!unmetSkills.has(req_skills[skill])) {
      backtrack(skill + 1);
      return;
    }

    for (const i of skillToPeople[skill]) {
      const mask = peopleMask[i];
      const skillsAdded: string[] = [];
      for (const s of unmetSkills) {
        if ((mask & (1 << skillIdx.get(s)!)) !== 0) {
          skillsAdded.push(s);
        }
      }
      if (skillsAdded.length === 0) continue;

      skillsAdded.forEach((s) => unmetSkills.delete(s));
      currentTeam.push(i);

      backtrack(skill + 1);

      currentTeam.pop();
      skillsAdded.forEach((s) => unmetSkills.add(s));
    }
  }

  backtrack(0);
  return bestTeam;
}
