class BlogName::Delete < Trailblazer::Operation
  step Model(BlogName, :find_by)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end
