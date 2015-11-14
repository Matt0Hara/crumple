require "spec_helper"
require "crumple"

module Crumple
  describe Mover do
    before(:all) do
      FileUtils.mkdir_p("~/Documents/")
      @mover = Mover.new
    end

    describe "#set_target_file" do
      it "sets the target file" do
        @mover.set_target_file("dummy.txt")
        expect(@mover.target_file).to eq("dummy.txt")
      end
    end

    describe "#get_target_file" do
      it "gets the target file" do
        @mover.target_file = "dummy.txt"
        expect(@mover.get_target_file).to eql("dummy.txt")
      end
    end

    describe "#dump" do
      it "raises an error if the target file does not exist", fakefs: true do
        @mover.set_target_file("dummy.txt")
        expect { @mover.dump }.to raise_error("File does not exist!")
      end

      it "moves a file to the dump directory", fakefs: true do
        FileUtils.touch("dummy.txt")
        origin_path = File.absolute_path("dummy.txt")
        @mover.set_target_file("dummy.txt")
        @mover.dump
        new_path = File.absolute_path("dummy.txt")
        expect(new_path.equal?(origin_path)).to be false
      end
    end

    describe "#get_dump_dir" do
      it "defaults dump directory if no config file is present", fakefs: true do
        expect(File.exist?("crumpleConfig.txt")).to be false
        FileUtils.touch("dummy.txt")
        @mover.set_target_file("dummy.txt")
        @mover.dump
        Dir.exist?("crumpledump")
        new_path = File.absolute_path("dummy.txt")
        expect(new_path).to eq("~/Documents/crumpledump/dummy.txt")
      end

      it "reads a custom dump directory from the config file", fakefs: true do
        FileUtils.touch(".crumpleconfig.txt")
        FileUtils.touch("dummy.txt")
        File.open(".crumpleconfig.txt", "a") do |file|
          file.print("~/Documents/dumplecrump/")
        end
        @mover.set_target_file("dummy.txt")
        @mover.dump
        file_moved = File.exist?("~/Documents/dumplecrump/dummy.txt")
        old_file_gone = File.exist?("/dummy.txt")
        expect(file_moved).to be true
        expect(old_file_gone).to be false
      end
    end

    describe "#set_dump_dir" do
      it "creates a new config file if none exists", fakefs: true do
        expect(File.exist?("crumpleconfig.txt")).to be false
        default_path = @mover.get_dump_dir
        expect(default_path).to eql("~/Documents/crumpledump/")
        @mover.set_dump_dir("~/Documents/dumplecrump/")
        new_path = "#{@mover.get_dump_dir}"
        # test should pass, but throws superclass mismatch
        expect(new_path).to eql("~/Documents/dumplecrump")
      end
    end
  end
end
