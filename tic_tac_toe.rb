# 畫出棋盤

def desplay_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# 兩個人輪流玩，直到遊戲結束

def turn_count(board, flag)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  
  if flag == 0 
    return counter
  else 
    return (counter - 1)
  end
end

def current_player(board, flag)
  if turn_count(board, flag).even?
    current_player = "X"
  elsif turn_count(board, flag).odd?
    current_player = "O"
  end
  return current_player
end

# 玩家給棋步 (1~9) 之後，在棋盤上印出對應的位置
# 驗證玩家有下棋，而且下棋的落點是對的

def where_to_place(board, n)
  if n < 10 && n > 0 
    if board[n-1] == " "
      board[n-1] = current_player(board, 0)
      return true
    else
      puts "This location has been chosen."
      puts "Please choose another one."
      return false
    end
  else
    puts "It's a wrong location."
    puts "Please choose a location again."
    return false
  end
end  

# 判斷遊戲結束的時間，以及遊戲結果是什麼

def result(board)
  if board[0] == board[1] && board[1] == board[2] && board[0] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[3] == board[4] && board[4] == board[5] && board[3] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[6] == board[7] && board[7] == board[8] && board[6] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[0] == board[3] && board[3] == board[6] && board[0] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[1] == board[4] && board[4] == board[7] && board[1] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[2] == board[5] && board[5] == board[8] && board[2] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[0] == board[4] && board[4] == board[8] && board[0] != " "
    puts " Player #{current_player(board, 1)} wins the game! "
    return false
  elsif board[2] == board[4] && board[4] == board[6] && board[2] != " "
    puts "Player #{current_player(board, 1)} wins the game! "
    return false
  end
  return true
end

# Main

puts "Welcome to Tic Tac Toe!"
puts "Where would you like to go?"

board = Array.new(9, " ")
desplay_board(board)

count = 1
while (result(board))
  puts ""
  puts "Run #{count}: Player #{current_player(board, 0)}, please choose a location (1~9)."
  location = gets.chomp().to_i
  display = where_to_place(board, location)
  desplay_board(board) if display
  count += 1 if display
end


