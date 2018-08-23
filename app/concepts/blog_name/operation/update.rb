class BlogName::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(BlogName, :find_by)
    step Contract::Build(constant: BlogName::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :blog_name)
  step Contract::Persist()
end
