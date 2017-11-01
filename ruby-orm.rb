jims_name = `sqlite3 orm_test.db "SELECT * FROM users WHERE id = 2;"`
jonis_name = `sqlite3 orm_test.db "SELECT * FROM users WHERE id = 3;"`
columns = `sqlite3 orm_test.db "PRAGMA table_info(users)"`
users = `sqlite3 orm_test.db "SELECT * FROM users"`


# col_str = columns.split("\n")

# keys = col_str.map { |str| str.split('|')[1].to_sym  }

# values = users.split('|')

# user_hash = Hash[keys.zip values]

# puts user_hash


class User

  def initialize( attr = {} )
  	attr.each do |k,v|
  		self.instance_variable_set("@#{k}", v)
  		self.class.send(:attr_accessor, k)
  		puts k
  		puts v
  	end
  	# @sql_base = 'sqlite3 orm_test.db'
  end

  def self.find(num)
  	user = `sqlite3 orm_test.db "SELECT * FROM users WHERE id = #{num};"`
  	columns = `sqlite3 orm_test.db "PRAGMA table_info(users);"`
  	col_str = columns.split("\n")

		keys = col_str.map { |str| str.split('|')[1].to_sym  }

		values = user.split('|').map(&:strip)

		user_hash = Hash[keys.zip values]

		User.new(user_hash)

  end

  def self.display_users
  	users = `sqlite3 orm_test.db "SELECT * FROM users;"`
  	puts users
  end

  def set_user(fn, ln)

  	`sqlite3 orm_test.db "INSERT INTO users (first_name, last_name) VALUES (#{fn}, #{ln});"`

  end

  def save
  	# Change this method so that if there is an id, save it. Otherwise INSERT INTO

  	
  	i_vars = self.instance_variables.map { |x| x.to_s.tr('@', '') }
  	i_var_vals = self.instance_variables.map { |x| instance_variable_get(x)}

  	trans_arr = []

  	i_vars.each_with_index do |x, i|
  		trans_arr.push("#{i_vars[i]} = '#{i_var_vals[i]}', ")
  	end
  	
  	set_string = trans_arr.join('').chomp(', ').to_s

  	# UPDATE users SET #{set_string} WHERE id = #{set_num};

  	`sqlite3 orm_test.db "UPDATE users SET #{set_string} WHERE id = #{@id};"`


  end

  def casey_save


  end

  def destroy
  	`sqlite3 orm_test.db "DELETE FROM users WHERE id = '#{@id}';"`
  end

end

p User.new(first_name: 'ryan', last_name: 'arthur')

test_one = User.find(2)

# puts test_one.first_name

# p User.find(2)


# puts User.display_users

# user.first_name = 'asf'

test_two = User.find(3)

test_two.save

test_two.destroy

User.display_users





