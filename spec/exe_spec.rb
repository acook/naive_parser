require 'spec_helper'

exe = './naive_parser'
test_file = './spec/fixtures/test_file.txt'

describe 'naive_parser executable' do
  it "exits with a raise when no file found" do
    status = Open4.popen4(exe) {}
    status.to_i.should eq(256)
  end

  it "doesn't fail when you pass in a file" do
    pinfo = Hash.new

    status = Open4.popen4(exe, test_file) do |pid, stdin, stdout, stderr|
      pinfo = {:pid => pid, :stdout => stdout.read, :stderr => stderr.read}
    end

    status.to_i.should eq(0), "## status: #{status.inspect} \n## pinfo: #{pinfo.inspect}"
  end
end
