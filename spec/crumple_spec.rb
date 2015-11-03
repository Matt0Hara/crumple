require "spec_helper"

describe Crumple do
  describe "#export_file" do
    dump_file = "dummy.txt"
    dump_dir = "/etc"
    it "moves a file to the dump directory", fakefs: true do
      FileUtils.touch(dump_file)
      Dir.mkdir(dump_dir)
      expect(File.exists?("dummy.txt")).to eq true
      expect(Dir.exist?(dump_dir))
    end
  end
end
