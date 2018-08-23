class BlogName::Show < Trailblazer::Operation
  step Model(BlogName, :find_by)
end
