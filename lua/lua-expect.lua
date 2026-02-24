--- lua-ssh
-- wait in seconds if needed
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end
-- run expect from shell to access router
local t = os.execute("/root/expect/shell_ssh.sh x.x.x.x ... ...")
ip.popen(t,  'r')
--print(t)
