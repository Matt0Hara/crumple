require "crumple/version"
require "fileutils"

module Crumple
  class Mover
    attr_accessor :target_file
    attr_reader :dump_dir

    def initialize
      @target_file = target_file
      @dump_dir = get_dump_dir
    end

    def set_dump_dir(new_dump_dir)
      config_file = ".crumpleconfig.txt"
      FileUtils.touch(config_file) unless File.exist?(config_file)
      File.open(config_file, "w") do |file|
        file.puts("#{new_dump_dir}")
      end
      @dump_dir = get_dump_dir
    end

    def get_dump_dir
      config_file = ".crumpleconfig.txt"
      if File.exist?(config_file)
        unless File.read(config_file).nil?
          return File.read(config_file)
        end
      else
        "/crumpledump/"
      end
    end

    def dump
      if File.exist?(@target_file)
        unless Dir.exist?(@dump_dir)
          FileUtils.mkdir(@dump_dir)
        end
        FileUtils.mv(@target_file, @dump_dir)
      else
        raise "File does not exist!"
      end
    end
  end
end
