default.pinto.bootstrap.user = 'root'
default.pinto.bootstrap.group = 'root'

default.pinto.bootstrap.repo_url = 'http://stratopan.com:2700/Stratopan/Pinto/Production'

default.pinto.bootstrap.home = "#{ENV['HOME']}/opt/local/pinto"


default.pinto.bootstrap.cpanminus_url = 'http://xrl.us/cpanm'

default.pinto.bootstrap.packages = %w[ ]

case platform 
    when 'centos'
        default.pinto.bootstrap.packages << 'zlib-devel'
end
