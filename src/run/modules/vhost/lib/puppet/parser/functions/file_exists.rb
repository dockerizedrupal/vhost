module Puppet::Parser::Functions
  newfunction(:file_exists, :type => :rvalue) do |args|
    File.exist?(args[0])
  end
end
