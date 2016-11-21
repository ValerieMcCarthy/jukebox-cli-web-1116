#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
 "Go Go GO" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/04.mp3',
 "Wolf" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/05.mp3',
 "Blue" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '/Users/ValerieMcCarthy/Development/jukebox-cli-web-1116/audio/Emerald-Park/07.mp3'
 }

def help
  puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"

end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  songlist = []
  songlist = my_songs.keys
  songlist.each do |song|
    puts song
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash


  puts "Please enter a song name or number:"
  user_request = gets.chomp

  if my_songs.include? (user_request)
    my_songs.each do |key, value|
      if user_request == key
        system "open #{value}"
        #having issues with this opening of file 
        # get error message: sh: path: No such file or directory
      end
    end
  else
    puts "Invalid input, please try again."
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  request = ""
  while request
    puts "Please enter a command:"
    request = gets.strip
    case request
      when "list"
        list(my_songs)
      when "play"
        play(my_songs)
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
