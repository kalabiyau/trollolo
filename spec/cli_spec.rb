require_relative 'spec_helper'

describe Cli do

  before(:each) do
    Cli.settings = dummy_settings
    @cli = Cli.new
    
    allow(STDOUT).to receive(:puts)
  end
  
  it "fetches burndown data" do
    expect_any_instance_of(BurndownData).to receive(:fetch)
    
    @cli.fetch_burndown_data
  end
  
  it "backups board" do
    expect_any_instance_of(Backup).to receive(:backup)
    @cli.options = {"board-id" => "1234"}
    @cli.backup
  end

end
