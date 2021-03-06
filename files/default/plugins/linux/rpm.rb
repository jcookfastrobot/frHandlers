#
# Author:: Claudio Cesar Sanchez Tejeda <demonccc@gmail.com>
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
# limitations under the License.
#

Ohai.plugin(:Rpm) do
  provides "rpm"
  depends "platform"

  collect_data(:default) do
    rpm Mash.new
    if %w{ rhel fedora suse }.include?(platform_family) or %w{ redhat fedora centos suse }.include?(platform)
    rpm_output = %x[ rpm -qa --queryformat 'rpm\\\["%{NAME}"\\\] = { "version" => "%{VERSION}", "release" => "%{RELEASE}" \\\}\n' ]
    eval(rpm_output)
    end
  end
end
