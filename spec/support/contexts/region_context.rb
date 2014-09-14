shared_context 'region' do
  def region
    controller.try(:region) || Regions::CHICAGO
  end
end
