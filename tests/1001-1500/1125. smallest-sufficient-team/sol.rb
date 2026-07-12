# @param {String[]} req_skills
# @param {String[][]} people
# @return {Integer[]}
def smallest_sufficient_team(req_skills, people)
  n = req_skills.size
  full = (1 << n) - 1
  idx = {}
  req_skills.each_with_index { |skill, i| idx[skill] = i }

  masks = people.map do |skills|
    mask = 0
    skills.each { |skill| mask |= (1 << idx[skill]) }
    mask
  end

  dp = Array.new(1 << n)
  dp[0] = []

  masks.each_with_index do |pmask, i|
    next if pmask == 0
    nxt = dp.dup
    (0..full).each do |mask|
      team = dp[mask]
      next if team.nil?
      nmask = mask | pmask
      cand = team + [i]
      if nxt[nmask].nil? || cand.length < nxt[nmask].length
        nxt[nmask] = cand
      end
    end
    dp = nxt
  end

  dp[full] || []
end
