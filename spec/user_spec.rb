require "spec_helper"
require "crumple"

feature "user uses the command line interface", %{
  As a user
  I want to archive a file
  So I can keep my workplace clean
} do
  scenario "user archives a file to the default directory", fakefs: true do
    FileUtils.touch("dummy.txt")
    origin_path = File.absolute_path("dummy.txt")
    system("crumple dummy.txt")
    new_path = File.absolute_path("dummy.txt")
    expect(new_path).to_not eq(origin_path)
    expect(new_path).to eq("/crumpledump/dummy.txt")
  end
end
