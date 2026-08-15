# @param {Integer} n
# @param {Integer[][]} languages
# @param {Integer[][]} friendships
# @return {Integer}
def minimum_teachings(n, languages, friendships)
    users_to_teach = Set.new
    
    friendships.each do |user1, user2|
        user1 -= 1
        user2 -= 1
        can_communicate = false
        languages[user1].each do |lang1|
            if languages[user2].include?(lang1)
                can_communicate = true
                break
            end
        end
        unless can_communicate
            users_to_teach.add(user1)
            users_to_teach.add(user2)
        end
    end
    
    min_users = languages.length + 1
    (1..n).each do |language|
        count = 0
        users_to_teach.each do |user|
            count += 1 unless languages[user].include?(language)
        end
        min_users = [min_users, count].min
    end
    min_users
end
