require "ndee/version"
require "apache_config"

module Ndee
  def self.document_roots_by_domain
    {}.tap do |mappings|
      each_domain do |domain, vhost|
        mappings[domain] = vhost.document_root
      end
    end
  end
  
  def self.sites_available
    '/etc/apache2/sites-available'
  end
  
  def self.each_domain
    Dir["#{sites_available}/*.conf"].each do |conf|
      config = Apache::Config.new(conf)
    
      for vhost in config.virtual_hosts
        next unless vhost.domain
    
        for domain in [vhost.domain] + vhost.aliases
          yield domain, vhost
        end
      end
    end
  end
  
  def self.cli!
    if name = ARGV.first
      if document_root = document_roots_by_domain[name]
        if Dir.exist? document_root
          exec 'cd', document_root
        else
          puts "#{document_root} doesn't exist"
        end
      else
        puts "#{name} not found"
      end
    else
      puts 'ndee cds into the DocumentRoot of the given domain.'
      puts 'Usage: ndee subdomain.example.com'
    end
  end
end
