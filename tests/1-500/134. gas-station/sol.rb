def can_complete_circuit(gas, cost)
  total = 0
  tank = 0
  start = 0
  gas.each_index do |i|
    diff = gas[i] - cost[i]
    total += diff
    tank += diff
    if tank < 0
      tank = 0
      start = i + 1
    end
  end
  total < 0 ? -1 : start
end
