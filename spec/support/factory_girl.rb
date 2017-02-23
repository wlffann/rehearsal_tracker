RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
