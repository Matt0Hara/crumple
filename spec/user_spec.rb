require "spec_helper"

feature %{
  As a user
  I want to archive a file
  So I can keep my workplace clean
} do

  def execute(file)
    system("crumple #{file}")
  end
  scenario "user archives a file", fakefs: true do
    FileUtils.touch("dummy.txt")
    execute("dummy.txt")
  end
end
