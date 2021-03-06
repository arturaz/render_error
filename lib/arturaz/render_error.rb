module Arturaz
  module RenderError
    def render_with_errors(options = nil, extra_options = {}, &block)
      if options.is_a? Hash and options.has_key?(:error)
        options[:layout] ||= true
        options[:status] ||= options[:error].to_i
        options[:locals] ||= {}
        options[:locals][:text] = options.delete(:text)
        
        filename = File.join(RAILS_ROOT, 'app', 'views', 'errors', 
          "#{options[:error]}.html.erb")
        if File.file?(filename)
          render_without_errors(
            options.merge(:file => filename),
            extra_options,
            &block
          )
        else
          render_without_errors(
            options.merge(
              :text => "<h1>Klaida #{options[:error]}!</h1>" +
                options[:locals][:text].to_s
            ),
            extra_options,
            &block
          )
        end
      else
        render_without_errors(options, extra_options, &block)
      end
    end
  end
end
