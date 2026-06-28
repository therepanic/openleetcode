# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
  stack = []

  asteroids.each do |asteroid|
    alive = true

    while alive && asteroid < 0 && !stack.empty? && stack[-1] > 0
      if stack[-1] < -asteroid
        stack.pop
      elsif stack[-1] == -asteroid
        stack.pop
        alive = false
      else
        alive = false
      end
    end

    stack << asteroid if alive
  end

  stack
end
