require 'chef/handler'
require 'chef/log'

class Chef
  class Handler
    class CookbookVersionsHandler < Chef::Handler

      def report
        cookbooks = run_context.cookbook_collection
#        cookbook_vers = {}
#        cookbooks.keys.each do |cb|
#          cookbook_vers[cb.name.to_s] = cb.version.to_s
#        end
#        node.default[cookbooks] = cookbook_vers

        Chef::Log.info("Cookbooks and versions run: #{cookbooks.keys.map {|x| cookbooks[x].name.to_s + " " + cookbooks[x].version} }")
      end
    end
  end
end
