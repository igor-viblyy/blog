# frozen_string_literal: true

class BlogName::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(BlogName, :new)
    step Contract::Build(constant: BlogName::Contract::Create)
  end

  step Nested( Present )
  step Contract::Validate( key: :blog_name )
  step Contract::Persist( )
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("Blog name created #{model.name}")
  end
end
