include_recipe "apt"

ubuntu_release = %x(lsb_release -irs).strip.sub( /\n/,'_')

apt_repository "arangodb" do
  uri "http://www.arangodb.org/repositories/arangodb2/x#{ubuntu_release}"
  distribution '/'
  key "https://www.arangodb.com/repositories/arangodb2/x#{ubuntu_release}/Release.key"
end

# This can  fail 'cause remote  repo  don't have a i386 package
# Must works with x86-84 bits
package "arangodb" do
  action :install
  version node[:arangodb][:package_version]
end