require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'

load './libxslt-ruby.gemspec'

# Rake task to build the default package
Rake::GemPackageTask.new(DEFAULT_SPEC) do |pkg|
  pkg.package_dir = 'admin/pkg'
  pkg.need_tar = true
end

# ------- Windows GEM ----------
if RUBY_PLATFORM.match(/win32/)
  binaries = (FileList['ext/mingw/*.so',
                       'ext/mingw/*.dll*'])

  # Windows specification
  win_spec = DEFAULT_SPEC.clone
  win_spec.extensions = ['ext/mingw/Rakefile']
  win_spec.platform = Gem::Platform::CURRENT
  win_spec.files += binaries.to_a

  # Rake task to build the windows package
  Rake::GemPackageTask.new(win_spec) do |pkg|
    pkg.package_dir = 'admin/pkg'
  end
end

# ---------  RDoc Documentation ------
desc "Generate rdoc documentation"
Rake::RDocTask.new("rdoc") do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "libxml-xslt"
  # Show source inline with line numbers
  rdoc.options << "--inline-source" << "--line-numbers"
  # Make the readme file the start page for the generated html
  rdoc.options << '--main' << 'README'
  rdoc.rdoc_files.include('doc/*.rdoc',
                          'ext/**/*.c',
                          'lib/**/*.rb',
                          'CHANGES',
                          'README',
                          'LICENSE')
end


Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "ext"
end

task :package => :rdoc
task :default => :package
