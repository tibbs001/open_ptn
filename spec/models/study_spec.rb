require 'rails_helper'

RSpec.describe Study, type: :model do

  before :each do
    @file1 = Rack::Test::UploadedFile.new('spec/support/files/data_file1.txt', 'text/text')
    @file2 = Rack::Test::UploadedFile.new('spec/support/files/data_file2.txt', 'text/text')
  end

  it "should verify email exists and create study with single attachment" do
    Study.delete_all
    status='proposed'
    title='study title'
    bs='ptn study summary'
    url='www.duke.edu'
    email='joe.smith@duke.edu'
    expect(Study.count).to eq(0)
    s=Study.create({:status=>status,:title=>title,:brief_summary=>bs,:url=>url,:file=>@file1})
    expect(Study.count).to eq(0)
    s.email=email
    s.save!
    expect(Study.count).to eq(1)
    expect(s.attachments.size).to eq(1)
    expect(s.attachment.file_name).to eq('data_file1.txt')
    expect(s.attachment.content_type).to eq('text/text')
  end

  it "should create study with multiple attachments" do
    Study.delete_all
    status='proposed'
    title='study title'
    bs='ptn study summary'
    url='www.duke.edu'
    email='joe.smith@duke.edu'
    expect(Study.count).to eq(0)
    s=Study.create({:status=>status,:email=>email,:title=>title,:brief_summary=>bs,:url=>url,:files=>[@file1,@file2]})
    expect(Study.count).to eq(1)
    expect(s.attachments.size).to eq(2)
  end

end
