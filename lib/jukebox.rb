require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help 
	puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
	
end

def list (songs)
	songlist = []
	songs.each_with_index do |item, index|
		num = index+1
		songlist << "#{num}. #{item}"
	end
	puts songlist
end

def play (songs)
	puts "Please enter a song name or number:"
	user_request = gets.chomp
	if songs.include? (user_request)
		puts "Playing #{user_request}"
	elsif user_request.to_i < 100 && user_request.to_i > 0
		puts "Playing #{songs[user_request.to_i - 1]}"
	else
	puts "Invalid input, please try again."
	end
end

def exit_jukebox
	puts "Goodbye"
end

def run(songs)
	help
	request = ""
	while request
		puts "Please enter a command:"
		request = gets.strip
		case request
			when "list"
				list(songs)
			when "play"
				play(songs)
			when "help"
				help
			when "exit"
				exit_jukebox
				break
			else
				help
		end
	end

end






