require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "snarl"
    gem.summary = %Q{JavaScript in Disguise}
    gem.description = %Q{Snarl is JavaScript in disguise, bridging Ruby and Rhino. JRuby required.}
    gem.email = "jon@joncrosby.me"
    gem.homepage = "http://github.com/jcrosby/snarl"
    gem.authors = ["Jon Crosby"]
    gem.rubyforge_project = "snarl"
    gem.add_development_dependency "rspec", ">= 1.2.9"
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :default => [:check_dependencies, :spec]

desc "Run all examples (or a specific spec with TASK=xxxx)"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_opts  = ["-c"]
  t.spec_files = begin
    if ENV["TASK"] 
      ENV["TASK"].split(',').map { |task| "spec/**/#{task}_spec.rb" }
    else
      FileList['spec/**/*_spec.rb']
    end
  end
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "thing #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

class Jeweler
  module Commands
    class InstallGem
      def use_sudo?
        false # favor security as a default
      end
    end
  end
end
