class BlogName::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::BlogName.all
  end
end
