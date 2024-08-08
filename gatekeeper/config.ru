$: << File.dirname(__FILE__)
require 'gate_keeper'
use Rack::RewindableInput::Middleware
run GateKeeper.new
