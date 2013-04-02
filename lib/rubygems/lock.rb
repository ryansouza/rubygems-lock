require "rubygems/lock/version"

class Gem::Specification
  def add_locked_dependencies
    require 'bundler'
    bundle = Bundler.definition

    development = bundle.specs_for([:development]).to_a
    default = bundle.specs_for([:default]).to_a - development

    default.each do |spec|
      add_dependency spec.name, spec.version.to_s
    end

    if self.respond_to? :add_development_dependency
      development.each do |spec|
        add_development_dependency spec.name, spec.version.to_s
      end
    end
  end
end
