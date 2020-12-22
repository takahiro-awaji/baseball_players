class Form::Base
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attribute :game_id
end
