require "spec_helper"
require "crumple"

module Crumple
  describe Mover do
    before do
      @mover = Mover.new("dummy.txt")
    end

    describe "#target_file" do
      it "has a target file" do
        expect(@mover.target_file).to eql("dummy.txt")
      end
    end

    describe "#dump_dir" do
      it "has a default dump directory", fakefs: true do
        expect(@mover.dump_dir).to eql("/crumpledump/")
      end

      # it "can add a dump directory" do
      #   @mover.dump_dir = "/etc"
      #   expect(@mover.dump_dir).to eql("/etc")
      # end
    end

    describe "#dump", fakefs: true do
      it "raises an error if the target file does not exist", fakefs: true do
        expect{ @mover.dump }.to raise_error("File does not exist!")
      end

      it "moves a file to the dump directory", fakefs: true do
        FileUtils.touch("dummy.txt")
        origin_path = File.absolute_path("dummy.txt")
        @mover.dump
        new_path = File.absolute_path("dummy.txt")
        expect(new_path.equal?(origin_path)).to be false
      end
    end

    describe "#get_dump_dir",fakefs: true do
      it "sets the dump directory to default if no config file is present" do
        expect(File.exist?("crumpleConfig.txt")).to be false
        FileUtils.touch("dummy.txt")
        @mover.dump
        Dir.exists?("crumpledump")
        expect(File.absolute_path("dummy.txt")).to eq("/crumpledump/dummy.txt")
      end
    end
  end
end
