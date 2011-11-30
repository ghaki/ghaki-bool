require 'ghaki/bool/accessors'
require 'ghaki/bool/options'

module Ghaki module Bool module Options_Testing
describe Ghaki::Bool::Options do

  class UsingDeclare
    extend  Ghaki::Bool::Accessors
    include Ghaki::Bool::Options
    bool_reader :my_reader
    bool_writer :my_writer
    bool_attr_reader :our_reader
    bool_attr_writer :our_writer
    bool_attr_accessor :debug, :verbose
    bool_reader_attr_writer :our_mixed
    attr_reader_bool_writer :our_weird
  end

  subject { UsingDeclare.new }

  describe '#bool_option' do

    it 'should detect = assignment' do
      subject.bool_option( {}, true, :our_mixed )
      subject.our_mixed?.should == true
    end

    it 'should detect ! assignment' do
      subject.bool_option( {}, false, :our_weird )
      subject.our_weird.should === false
    end

    it 'should set default if not present' do
      subject.bool_option( {}, false, :debug )
      subject.debug.should == false
    end

    it 'should use option if present' do
      subject.bool_option( { :verbose => true }, false, :verbose )
      subject.verbose.should == true
    end

  end

end
end end end
