# frozen_string_literal: true

module Mhp
  NUMBER_OF_DOORS = 3

  def self.init_doors(n)
    doors = Array.new(n, false)
    success_door = rand(doors.size)
    doors[success_door] = true
    doors
  end
  
  def self.play(choice, switch)
    range = (0...NUMBER_OF_DOORS)
    raise ArgumentError, "choice must be within the following range #{range}" unless range === choice
    
    doors = init_doors(NUMBER_OF_DOORS)
    player_choice = choice
    host_choice = nil

    doors.each_index do |i|
      if i != player_choice and doors[i] != true
        host_choice = i
        break
      end
    end
  
    if switch
      doors.each_index do |i|
        if i != player_choice and i != host_choice
          player_choice = i
          break
        end
      end
    end
  
    if doors[player_choice]
      true
    else
      false
    end
  end
  
  def self.simulate(n, switch = true)
    result = {"success" => 0, "failure" => 0}
    return result if n < 1

    n.times do
      res = play(0, switch)
      if res
        result["success"] += 1
      else
        result["failure"] += 1
      end
    end
  
    result
  end
end
