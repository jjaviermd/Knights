require_relative "chessboard.rb"

def knight_moves(s, e)
  dist = solve (s)
  return reconstruction(s, e, dist)

end


def solve(s)
  queue =[s]

  visited=Array.new($chessboard.length, false)
  visited[s] = true

  dist = Array.new($chessboard.length, -1)
  dist[s]= 0
  
  while !queue.empty?
    current = queue.shift
    neighboors = $chessboard[current]
    neighboors.each do |n|
      unless visited[n]
        visited[n]=true
        dist[n] = dist[current] + 1
        queue.push(n)
      end
    end
  end
  return dist
end

def reconstruction(s, e, dist)
  path = []
end


p solve(2)
# knight_moves(42, 34)

# puts "Here is your path"

  

#   until queue.empty? do
#     current = queue.shift
#     puts current

#     return true if current == target

#     $chessboard[current].each do |son| 
#       queue.push(son) unless queue.include?(son) || son == start
#     end

#   end