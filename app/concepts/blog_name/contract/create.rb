require 'reform'

module BlogName::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveModel
    include Reform::Form::ActiveModel::ModelReflections

    model :blog_name

    property :name, validates: { presence: true }

  end
end
