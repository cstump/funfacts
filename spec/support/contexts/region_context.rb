shared_context 'region' do
  def region
    controller.try(:region) || Region.chicago
  end
end
