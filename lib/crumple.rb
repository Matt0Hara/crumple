require "crumple/version"

module Crumple
  class Mover
    attr_reader :target_file

    def initialize(target_file)
      @target_file = target_file
    end
  end
end
