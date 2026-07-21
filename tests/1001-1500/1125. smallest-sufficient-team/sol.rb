# @param {String[]} req_skills
# @param {String[][]} people
# @return {Integer[]}
def smallest_sufficient_team(req_skills, people)
    # Convert all sublists into sets
    people.each_with_index do |skills, i|
        people[i] = skills.to_set
    end

    # Remove all skill sets that are subset of another skillset
    people.each_with_index do |i_skills, i|
        people.each_with_index do |j_skills, j|
            if i != j && i_skills.subset?(j_skills)
                people[i] = Set.new
            end
        end
    end

    # Build dictionary of skills to the people who can perform them
    skills_to_people = Hash.new { |h, k| h[k] = Set.new }
    people.each_with_index do |skills, i|
        skills.each do |skill|
            skills_to_people[skill].add(i)
        end
    end

    @unmet_skills = req_skills.to_set
    @smallest_length = Float::INFINITY
    @current_team = []
    @best_team = []

    define_method(:meet_skill) do |skill = 0|
        if @unmet_skills.empty?
            if @smallest_length > @current_team.length
                @smallest_length = @current_team.length
                @best_team = @current_team.dup
            end
            return
        end

        if !@unmet_skills.include?(req_skills[skill])
            meet_skill(skill + 1)
            return
        end

        skills_to_people[req_skills[skill]].each do |i|
            skills_added_by_person = people[i].intersection(@unmet_skills)
            @unmet_skills = @unmet_skills - skills_added_by_person
            @current_team.push(i)

            meet_skill(skill + 1)

            @current_team.pop
            @unmet_skills = @unmet_skills.union(skills_added_by_person)
        end
    end

    meet_skill()
    @best_team.to_a
end
