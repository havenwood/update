unless Object.const_defined? 'Update'
  $:.unshift File.expand_path '../../lib', __FILE__
  require 'update'
end

require 'minitest/autorun'
require 'minitest/pride'