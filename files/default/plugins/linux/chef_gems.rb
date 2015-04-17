Ohai.plugin(:ChefGems) do
  require 'mixlib/shellout'
  provides 'chef_gems'

  collect_data(:default) do
    chef_gems Mash.new
    chef_gems[:gems] = {}
    gem_list = shell_out("/opt/chef/embedded/bin/gem list")
    gem_list.stdout.each_line do |line|
      gem_name, installed_vers = line.split(/\(/, 2).map {|i| i.strip}
      gem_vers = installed_vers.gsub(/\)/,"").split(',').map {|i| i.lstrip}
      chef_gems[:gems]["#{gem_name}"] = gem_vers
    end
  end
end
