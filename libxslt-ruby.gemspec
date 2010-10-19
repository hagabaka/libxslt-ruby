require 'rake'
require 'date'

# ------- Default Package ----------
FILES = FileList[
  'Rakefile',
  'CHANGES',
  'README',
  'LICENSE',
  'setup.rb',
  'doc/**/*',
  'lib/**/*',
  'ext/libxslt/*.h',
  'ext/libxslt/*.c',
  'ext/mingw/Rakefile',
  'ext/vc/*.sln',
  'ext/vc/*.vcproj',
  'test/**/*',
  'libxslt-ruby.gemspec'
]

# Default GEM Specification
DEFAULT_SPEC = Gem::Specification.new do |spec|
  spec.name = "libxslt-ruby-mw"
  
  spec.homepage = "http://libxslt.rubyforge.org/"
  spec.summary = "Ruby libxslt bindings"
  spec.description = <<-EOF
    The Libxslt-Ruby project provides Ruby language bindings for the GNOME  
    XSLT C library.  It is free software, released under the MIT License.
  EOF

  # Determine the current version of the software
  spec.version = 
    if File.read('ext/libxslt/version.h') =~ /\s*RUBY_LIBXSLT_VERSION\s*['"](\d.+)['"]/
      CURRENT_VERSION = $1
    else
      CURRENT_VERSION = "0.0.0"
    end
  
  spec.author = "Charlie Savage"
  spec.email = "libxml-devel@rubyforge.org"
  spec.add_dependency('libxml-ruby','>=0.9.4')
  spec.platform = Gem::Platform::RUBY
  spec.require_paths = ["lib", "ext/libxslt"] 
 
  spec.bindir = "bin"
  spec.extensions = ["ext/libxslt/extconf.rb"]
  spec.files = FILES.to_a
  spec.test_files = Dir.glob("test/tc_*.rb")
  
  spec.required_ruby_version = '>= 1.8.4'
  spec.date = DateTime.now
  spec.rubyforge_project = 'libxslt-ruby'
  
  spec.has_rdoc = true
end

