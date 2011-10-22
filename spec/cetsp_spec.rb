require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Cetsp" do

  SOURCE = File.expand_path(File.dirname(__FILE__) + '/../spec/sample/ocorrencias.html')
  EMPTY  = File.expand_path(File.dirname(__FILE__) + '/../spec/sample/empty.html')

  before :each do
    @cetsp = CetSp::Parser.new(SOURCE)
  end

  it "should load a sample file" do
    @cetsp.should_not be nil
  end

  it "should return whatever" do
    @cetsp.parse.first.code.should == 206
  end

  it "should read an empty resource and return an empty array" do
    @cetsp = CetSp::Parser.new(EMPTY)
    @cetsp.parse.should == []

  end

  it "should work with real site" do
    p CetSp::Parser.new("http://cetsp1.cetsp.com.br/monitransmapa/IMG10/ocorrencias.asp").parse
  end

end

