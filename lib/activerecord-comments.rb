$:.unshift File.dirname(__FILE__)

if defined?(ActiveRecord)

  # Main class for ActiveRecord::Comments ActiveRecord extension gem
  #
  # Used for global configuration options / etc for the extension
  class ActiveRecord::Comments
  end

end

if defined?(ActiveRecord::Base) && defined?(ActiveRecord::ConnectionAdapters::Column)
  
  # require and include our modules which add the 'comment' functionality to ActiveRecord

  require 'activerecord-comments/base_ext'
  require 'activerecord-comments/column_ext'

  ActiveRecord::Base.send                       :include, ActiveRecord::Comments::BaseExt
  ActiveRecord::ConnectionAdapters::Column.send :include, ActiveRecord::Comments::ColumnExt

end