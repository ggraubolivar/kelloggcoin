# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# 1. Obtain length of object.

N = blockchain.size-1

# 2. Loop over object and construct a unique array of users.

users = []

for i in (0..N)
  froms = blockchain[i]["from_user"]
  users.push(froms)
  tos = blockchain[i]["to_user"]
  users.push(tos)
end

users = users.uniq
users = users.compact!
users = users.sort!

# 3. Loop over each node, and grab to and from transactions into a running balance by user and store into an array.

balances = []

for user in users
  balance = 0
  for i in (0..N)
    if blockchain[i]["to_user"] == user
      balance = balance + blockchain[i]["amount"]
    elsif blockchain[i]["from_user"] == user
      balance = balance - blockchain[i]["amount"]
    end
  end
  part = {"user" => user, "balance" => balance}
  balances.push(part)
end

# 4. Since the output is sorted by order, we rank the array according to the balance "key."

balances = balances.sort_by! {|k| -k["balance"]}

# 5. Loop over the user list and display each user's balance.

J = balances.size-1
for i in (0..J)
    name = balances[i]["user"]
    propername = name.capitalize()
    puts "#{propername}'s KelloggCoin balance is #{balances[i]["balance"]}"
end

# Note: This code should be insensitive to new transactions added to the blockchain. 
# That is, if new users are issued KelloggCoin, or new transfers between existing users occur
# this code should still output a sorted list of users by their coin balances. 

# I've tried editing the blockchain array and it works! Yay!