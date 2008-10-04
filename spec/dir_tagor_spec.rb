require 'spec/spec_helper'

describe "Dir#tagor" do
  it "should find all file containing any of the tags" do
    tagged_files = Dir.tagor('spec/tagged_files/*.rb','bar', 'lulz')
    tagged_files.should_not include('spec/tagged_files/foo.rb')
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
    tagged_files.should include('spec/tagged_files/epic_lulz.rb')
  end

  it "should find all file containing any of the tags" do
    tagged_files = Dir.tagor('spec/tagged_files/*.rb','foo')
    tagged_files.should include('spec/tagged_files/foo.rb')
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
    tagged_files.should_not include('spec/tagged_files/epic_lulz.rb')
  end


  it "should not select files that are not tagged with specified tags" do
    tagged_files = Dir.tagor('spec/tagged_files/*.rb','lol','rofl')
    tagged_files.should be_empty
  end

end