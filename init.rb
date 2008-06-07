ActionController::Base.send :include, Arturaz::RenderError
ActionController::Base.send :alias_method_chain, :render, :errors