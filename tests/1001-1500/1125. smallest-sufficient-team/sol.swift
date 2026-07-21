class Solution {
    private var unmetSkills: Set<String> = []
    private var smallestLength = Int.max
    private var currentTeam: [Int] = []
    private var bestTeam: [Int] = []
    private var reqSkills: [String] = []
    private var peopleSets: [Set<String>] = []
    private var skillsToPeople: [String: Set<Int>] = [:]

    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        self.reqSkills = req_skills
        let n = people.count
        peopleSets = people.map { Set($0) }

        // Remove all skill sets that are subset of another skillset
        for i in 0..<n {
            for j in 0..<n {
                if i != j && peopleSets[i].isSubset(of: peopleSets[j]) {
                    peopleSets[i] = []
                }
            }
        }

        // Build dictionary of skills to the people who can perform them
        for i in 0..<n {
            for skill in peopleSets[i] {
                skillsToPeople[skill, default: []].insert(i)
            }
        }

        unmetSkills = Set(req_skills)

        func meetSkill(_ skill: Int = 0) {
            if unmetSkills.isEmpty {
                if smallestLength > currentTeam.count {
                    smallestLength = currentTeam.count
                    bestTeam = currentTeam
                }
                return
            }

            if skill >= reqSkills.count || !unmetSkills.contains(reqSkills[skill]) {
                meetSkill(skill + 1)
                return
            }

            guard let candidates = skillsToPeople[reqSkills[skill]] else { return }

            for i in candidates {
                let skillsAdded = peopleSets[i].intersection(unmetSkills)
                unmetSkills.subtract(skillsAdded)
                currentTeam.append(i)

                meetSkill(skill + 1)

                currentTeam.removeLast()
                unmetSkills.formUnion(skillsAdded)
            }
        }

        meetSkill()
        return bestTeam
    }
}
