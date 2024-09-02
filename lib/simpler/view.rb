require 'erb'

module Simpler
  class View
    VIEW_BASE_PATH = 'app/views'.freeze
    FORMAT = { plain: 'text', html: 'html', json: 'json' }.freeze

    def initialize(env)
      @env = env
    end

    def render(binding)
      template = File.read(template_path)

      ERB.new(template).result(binding)
    end

    private

    def controller
      @env['simpler.controller']
    end

    def action
      @env['simpler.action']
    end

    def template
      @env['simpler.template']
    end

    def template_format
      template_format = @env['simpler.template_format']
      format = template_format.nil? ? 'html'.to_sym : template_format.values.first

      FORMAT[format]
    end

    def template_path
      path = template || [controller.name, action].join('/')
      @env['simpler.template_name'] = "#{path}.#{template_format}.erb"

      Simpler.root.join(VIEW_BASE_PATH, @env['simpler.template_name'])
    end
  end
end
