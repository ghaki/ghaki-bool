module Ghaki #:nodoc:
module Bool  #:nodoc:

# Boolean attribute helpers.
module Options

  # Given token, check option hash and return value or default.
  def bool_option opts, defval, token
    newval = if opts.has_key?(token) and (not opts[token].nil?)
               opts[token]
             else
               defval
             end
    func_put = (token.to_s + '=').to_sym
    unless self.respond_to?(func_put)
      func_put = (token.to_s + '!').to_sym
      unless self.respond_to?(func_put)
        raise NoMethodError, 'Missing Asssignment',
          func_put, opts, defval, token
      end
    end
    send( func_put, newval )
  end

  # Handle multiple tokens for checking boolean options.
  def bool_options opts, defval, *tokens
    tokens.each do |token|
      bool_option opts, defval, token
    end
  end

end
end end
