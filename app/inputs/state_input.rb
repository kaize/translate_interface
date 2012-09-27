class StateInput < SimpleForm::Inputs::CollectionSelectInput
  def input
    object.state_transitions.map {|s| [s.human_event, s.event]}
  end
end