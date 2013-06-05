module PintoLibrary
    def pinto_home
        if node.pinto.bootstrap.user == 'root'
            pinto_home = '/opt/local/pinto'
        else
            pinto_home = "/home/#{node.pinto.bootstrap.user}/opt/local/pinto"
        end
            pinto_home
    end

    def pinto_sub_dirs
        if node.pinto.bootstrap.user == 'root'
            %w{ /opt /opt/local /opt/local/pinto /opt/local/pinto/bin /opt/local/pinto/misc /opt/local/pinto/misc/bin }
        else node.pinto.bootstrap.user == 'root'
            %w{ opt opt/local opt/local/pinto opt/local/pinto/bin opt/local/pinto/misc opt/local/pinto/misc/bin }.map do |d|
                "/home/#{node.pinto.bootstrap.user}/#{d}"
            end
        end
    end

    def create_pinto_sub_dirs
        log "create pinto_home sub directories"
        pinto_sub_dirs.each do |d|
            directory d do
                owner node.pinto.bootstrap.user
                group node.pinto.bootstrap.group
            end
        end
    end

    def  repo_root

        if node.pinto.bootstrap.user == 'root'
            repo_root = '/opt/local/pinto/var/'
        else
            repo_root = "/home/#{node.pinto.bootstrap.user}/opt/local/pinto/var"
        end
    end

    def pinto_user_home 
        node.pinto.bootstrap.user == 'root' ? nil : "/home/#{node.pinto.bootstrap.user}"
    end        
end

