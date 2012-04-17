require 'celluloid'

module Enumerable
  def each &block
    map do |command_group| 
      Celluloid::Future.new command_group, &block
    end.map { |future| future.value }
  end
end
