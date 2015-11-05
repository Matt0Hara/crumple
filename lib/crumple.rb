require "crumple/version"
require "fileutils"

module Crumple
  class Mover
    attr_reader :target_file, :dump_dir

    def initialize(target_file)
      @target_file = target_file
      @dump_dir = get_dump_dir
    end

    def get_dump_dir
      if File.exist?(".crumpleconfig.txt")
        unless File.read(".crumpleconfig.txt").nil?
          return  File.read(".crumpleconfig.txt")
        end
      else
        "/crumpledump/"
      end
    end

    def dump
      if File.exist?(@target_file)
        unless Dir.exists?(@dump_dir)
          FileUtils.mkdir(@dump_dir)
        end
        origin_file = File.absolute_path(@target_file)
        FileUtils.mv(@target_file, @dump_dir)
      else
        raise "File does not exist!"
      end
    end

  end
end
