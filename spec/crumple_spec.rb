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
      it "has a default dump directory" do
        expect(@mover.dump_dir).to eql("/crumpledump")
      end

      it "can add a dump directory" do
        @mover.dump_dir = "/etc"
        expect(@mover.dump_dir).to eql("/etc")
      end
    end

    describe "#dump", fakefs: true do
      it "raises an error if the target file does not exist" do
        expect(File.exist?("dummy.txt").to eql(false))
        expect(@mover.dump("dummy.txt")).to
        output("File does not exist!").to_stdout
      end

      it "moves a file to the dump directory" do
        File.touch("dummy.txt")
        origin_path = File.path("dummy.txt")
        expect(File.exist?("dummy.txt")).to eql(true)
        @mover.dump_file
        expect(File.path("dummy.txt")).to_not eql(origin_path)
      end
    end
  end
end
