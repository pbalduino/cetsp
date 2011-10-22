require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Cetsp" do

  SOURCE = File.expand_path(File.dirname(__FILE__) + '/../spec/sample/ocorrencias.html')

  before :each do
    @cetsp = CetSp::Parser.new(SOURCE)
  end

  it "should load a sample file" do
    @cetsp.should_not be nil
  end

  it "should return whatever" do
    p '---->', @cetsp.parse
  end

end

