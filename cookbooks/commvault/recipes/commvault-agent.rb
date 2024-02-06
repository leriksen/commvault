directory "#{node['commvault']['agent-service-home']}" do
  recursive true
end

template "#{node['commvault']['agent-service-install-file']}" do
  source 'commvault-agent-install.erb'
end

template "#{node['commvault']['service_template']}" do
  source 'commvault-agent-start.erb'
end
