require 'minitest/autorun'

require 'rubygems/lock'

# Uses this gem's Gemfile

describe "A gemspec with locked dependencies" do
  before do
    @gemspec = Gem::Specification.new do |spec|
      spec.name = "fakespec"
      spec.version = "1.0.0"
      spec.authors = "nobody"
      spec.add_locked_dependencies
    end
  end

  it "includes the runtime dependencies with exact versions" do
    deps = @gemspec.dependencies
    deps = deps.select {|d| d.type == :runtime}
    deps = deps.sort_by(&:name)
    deps = deps.map {|d| [d.name.to_s, d.requirement.to_s]}
    deps.must_equal [["rubygems-lock", "= #{Rubygems::Lock::VERSION}"]]
  end

  it "includes the development dependencies with exact versions" do
    deps = @gemspec.dependencies
    deps = deps.select {|d| d.type == :development}
    deps = deps.sort_by(&:name)
    deps = deps.map {|d| [d.name.to_s, d.requirement.to_s]}
    deps.must_equal [["bundler", "= 1.3.4"], ["minitest", "= 4.7.0"], ["rake", "= 10.0.4"]]
  end
end

describe "A gemspec without the ability to use development dependencies" do
  before do
    @gemspec = Gem::Specification.new do |spec|
      spec.name = "fakespec"
      spec.version = "1.0.0"
      spec.authors = "nobody"
      class << spec
        undef_method :add_development_dependency
      end
      spec.add_locked_dependencies
    end
  end

  it "includes the runtime dependencies with exact versions" do
    deps = @gemspec.dependencies
    deps = deps.select {|d| d.type == :runtime}
    deps = deps.sort_by(&:name)
    deps = deps.map {|d| [d.name.to_s, d.requirement.to_s]}
    deps.must_equal [["rubygems-lock", "= #{Rubygems::Lock::VERSION}"]]
  end

  it "includes the development dependencies with exact versions" do
    deps = @gemspec.dependencies
    deps = deps.select {|d| d.type == :development}
    deps = deps.sort_by(&:name)
    deps = deps.map {|d| [d.name.to_s, d.requirement.to_s]}
    deps.must_equal []
  end
end

