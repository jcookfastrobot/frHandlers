require 'chef/handler'
require 'chef/log'

class Chef
  class Handler
    class CookbookVersionsHandler < Chef::Handler

      def report
        cookbooks = run_context.cookbook_collection
        Chef::Log.info("Cookbooks and versions run: #{cookbooks.keys.map {|x| cookbooks[x].name.to_s + " " + cookbooks[x].version} }")
      end
    end
  end
end
