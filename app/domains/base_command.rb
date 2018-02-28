class BaseCommand
  include Dry::Transaction

  def self.run(params, &block)
    new.call(params, &block)
  end
end
