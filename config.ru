require_relative 'config/environment'
require_relative 'lib/middleware/logger'

use SimplerLogger, 'log/app.log'
run Simpler.application
