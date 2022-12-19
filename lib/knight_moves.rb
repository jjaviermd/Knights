require "pry-byebug"
require_relative "chessboard.rb"

def knight_moves(s, e)
  
  raise StandardError, "invalid cells" if !s.between?(0, $chessboard.length) || !e.between?(0, $chessboard.length)
  dist = solve(s)
  reconstruction(s, e, dist)

end


def solve(s)
  queue =[s]

  visited=Array.new($chessboard.length, false)
  visited[s] = true

  dist = Array.new($chessboard.length, -1)
  dist[s]= 0

  parents = []
  while !queue.empty?
    current = queue.shift
    neighboors = $chessboard[current]
    neighboors.each do |n|
      unless visited[n]
        visited[n]=true
        dist[n] = dist[current] + 1
        parents[n] = current
        queue.push(n)
      end
    end
  end
  return parents
end

def reconstruction(s, e, dist)
  path = [e]
  p = e
  until p.nil?
    p = dist[p]
    path.push(p)
  end
  edges = path.size-1
  f_path = path.compact!.reverse!.join(" --> ")
  puts "You made it in #{edges} moves. Here is your path!"
  puts f_path
end

knight_moves(0, 63)