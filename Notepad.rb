# This is supposed to mildly replicate a TextEditor--just not in GUI form.
# Michael Groff
# Date: March 30, 2016
# NotePad


class Notepad
	# This function will read an existing text file
	# If no file exists, it will show an error. Refer to line 20
	def read()
		print "Name of Text File: "
		name_of_file = gets.chomp.to_s
		check_if_file_exist = File.exist?(name_of_file)
		while check_if_file_exist != true
			puts "The file that you searched for does not exist."
			puts "Please try again."
			print "Name of Text File: "
		    name_of_file = gets.chomp.to_s
		    check_if_file_exist = File.exist?(name_of_file)
		    if check_if_file_exist == true
		    	break
		    end
		end
		time = Time.new
		file_name = name_of_file
		log_info = "\r\n| #{time}, 'READ' #{file_name} "
		File.open("log.txt", 'a+') {|y| y << log_info}
		if check_if_file_exist == true
			open_txt = open(name_of_file, 'r')
		    puts "\t#{name_of_file}: \n\n"
		    puts open_txt.read
		    open_txt.close
		else
			puts "\aThat filename does not exist in your current directory."
			puts call_function.read()
		end 
		puts "Press the enter key to exit: "
		exit = gets.chomp

	end
    # This function will edit an existing text file
    # If no file exists, it will show an error. Refer to line 37
	def edit()
		print "Name of Text File: "
		name_of_file = gets.chomp.to_s
		check_if_file_exist = File.exist?(name_of_file)
		while check_if_file_exist != true
			puts "The file that you searched for does not exist."
			puts "Please try again."
			print "Name of Text File: "
		    name_of_file = gets.chomp.to_s
		    check_if_file_exist = File.exist?(name_of_file)
		    if check_if_file_exist == true
		    	break
		    end
		end
		time = Time.new
		file_name = name_of_file
		log_info = "\r\n| #{time}, 'EDIT' #{file_name} "
		File.open("log.txt", 'a+') {|y| y << log_info}
		if check_if_file_exist == true
			show_txt = open(name_of_file, 'r')
		    puts show_txt.read
		    show_txt.close
		    add_txt = gets.chomp.to_s
		    File.open(name_of_file, 'a+') {|f| f << add_txt}
		else
			puts "\aThat filename does not exist in your current directory."
			puts call_function.edit()
		end
		puts log()
		puts "\n\nPress the enter key to exit: "
		exit = gets.chomp
	end

	def create_new()
		print "Name of Text File: "
		name_of_file = gets.chomp.to_s
		add_txt = gets.chomp.to_s
		create_new_file = File.open(name_of_file, 'w+') {|i| i << add_txt}
		time = Time.new
		file_name = name_of_file
		log_info = "\r\n| #{time}, 'CREATE NEW' #{file_name} "
		File.open("log.txt", 'a+') {|y| y << log_info}
		puts "Press the enter key to exit: "
		exit = gets.chomp
		create_new_file.close
	end

	def delete()
		print "Name of Text File: "
		name_of_file = gets.chomp.to_s
		check_if_file_exist = File.exist?(name_of_file)
		while check_if_file_exist != true
			puts "The file that you searched for does not exist."
			puts "Please try again."
			print "Name of Text File: "
		    name_of_file = gets.chomp.to_s
		    check_if_file_exist = File.exist?(name_of_file)
		    if check_if_file_exist == true
		    	break
		    end
		end
		puts "Deleting..."
		File.delete(name_of_file) 
        puts "'#{name_of_file}' is deleted."
        gets.chomp
        time = Time.new
		file_name = name_of_file
		log_info = "\r\n| #{time}, 'DELETE' #{file_name} "
		File.open("log.txt", 'a+') {|y| y << log_info}
	end

end

call_function = Notepad.new

puts "\t\t\t\tNotepad 1.0.8\n\n"
puts "\tDo you want to 'read', 'edit', 'delete' or 'create new' Text file?"
print "\n>>> "
turning_point = gets.chomp.downcase.to_s

if turning_point == "read"
	puts call_function.read()
elsif turning_point == "edit"
	puts call_function.edit()
elsif turning_point == "create new"
	puts call_function.create_new()
elsif turning_point == "delete"
	puts call_function.delete()
else
	puts "\aAn unkown error stopped the loading proccess."
	puts "Please tell us what happened or close the window and relaunch the program."
	puts "Your Message: "
	users_error_message = gets.chomp.to_s
	time = Time.new
	log_info = "\r\n|ERROR #{time}, USER ENTERED #{turning_point}. ERROR MESSAGE: #{users_error_message}"
    File.open("log.txt", 'a+') {|y| y << log_info}
    puts "Thanks for your message. You can exit at anytime."
	gets.chomp
end
