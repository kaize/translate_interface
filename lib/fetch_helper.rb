module FetchHelper
  class Object
    def fetch hash, *args
      args.collect { |arg| hash[arg] }
    end
  end
end