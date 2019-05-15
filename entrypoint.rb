require 'logger'


# Execute bash command on host system.
def execute_bash_cmd(cmd)
  return system(cmd) ? $logger.info("Command executed sucessfully") : fail("Error occured. Please check the logs")
end
#
# Checks if a given ENV exists.
def env_exists(env_key)
  env_val = ENV[env_key] || ""
  return !env_val.empty?
end

$logger = Logger.new(STDOUT)
$logger.level = Logger::INFO
$logger.info("Start logging...")
$logger.info("Check set environment variables.")

required_envs = ["KONTENA_TOKEN", "KONTENA_URL", "KONTENA_GRID", "KONTENA_SERVICE"]
required_envs.each do |env|
  if not env_exists(env)
    $logger.error("Env '%s' is required. " % env)
    fail "Required Environments-Variables are missing. Please set them!"
  end
end

log_file='logs'
cmd = "kontena service logs -f %s > %s 2>&1 &" % (ENV["KONTENA_SERVICE"], log_file)
execute_bash_cmd(cmd)

$logger. info("Log service %s..." % ENV["KONTENA_SERVICE"])
cmd = "frontail --port 9100 %s" % log_file
execute_bash_cmd(cmd)
