require 'ghaki/bool/accessors'

module Ghaki module Bool module Acccessors_Testing
describe Ghaki::Bool::Accessors do

  context 'using extend' do

    class UsingExtend
      extend Ghaki::Bool::Accessors
    end

    subject { UsingExtend }

    it { should respond_to :bool_reader }
    it { should respond_to :bool_writer }
    it { should respond_to :bool_attr_reader }
    it { should respond_to :bool_attr_writer }
    it { should respond_to :bool_attr_accessor }
    it { should respond_to :bool_reader_attr_writer }
    it { should respond_to :attr_reader_bool_writer }

  end

  context 'using declarations' do

    class UsingDeclare
      extend Ghaki::Bool::Accessors
      bool_reader :my_reader
      bool_writer :my_writer
      bool_attr_reader :our_reader
      bool_attr_writer :our_writer
      bool_attr_accessor :debug, :verbose
      bool_reader_attr_writer :our_mixed
      attr_reader_bool_writer :our_weird
    end

    subject { UsingDeclare.new }

    describe '#bool_reader' do
      it { should     respond_to :my_reader? }
      it { should_not respond_to :my_reader  }
      it { should_not respond_to :my_reader= }
      it { should_not respond_to :my_reader! }
    end

    describe '#bool_writer' do
      it { should     respond_to :my_writer! }
      it { should_not respond_to :my_writer  }
      it { should_not respond_to :my_writer= }
      it { should_not respond_to :my_writer? }
    end

    describe '#bool_attr_reader' do
      it { should respond_to :our_reader  }
      it { should respond_to :our_reader? }
    end

    describe '#bool_attr_writer' do
      it { should respond_to :our_writer! }
      it { should respond_to :our_writer= }
    end

    describe '#bool_attr_accessor' do
      it { should respond_to :debug  }
      it { should respond_to :debug= }
      it { should respond_to :debug? }
      it { should respond_to :debug! }
      it { should respond_to :verbose  }
      it { should respond_to :verbose= }
      it { should respond_to :verbose? }
      it { should respond_to :verbose! }
    end

    describe '#bool_reader_attr_writer' do
      it { should     respond_to :our_mixed? }
      it { should     respond_to :our_mixed= }
      it { should_not respond_to :our_mixed  }
      it { should_not respond_to :our_mixed! }
    end

    describe '#attr_reader_bool_writer' do
      it { should     respond_to :our_weird  }
      it { should     respond_to :our_weird! }
      it { should_not respond_to :our_weird= }
      it { should_not respond_to :our_weird? }
    end

  end

end
end end end
