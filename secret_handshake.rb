class SecretHandshake
  attr_reader :binary_digits, :command_options

  def initialize(number)
    @binary_digits = number.to_i.to_s(2).split("")
    @command_options = ["wink", "double blink", "close your eyes", "jump"]
  end

  def commands
    command_list = []
    digits = binary_digits.reverse

    digits.each_index do |index|
      return command_list.reverse if (index == 4 && digits[index] == "1")
      break if index == 4
      command_list.push(command_options[index]) if digits[index] == "1"
    end

    command_list
  end
end

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.