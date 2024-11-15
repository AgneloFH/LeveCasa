# frozen_string_literal: true

module Layout
  class AppLayoutComponent < ViewComponent::Base
    renders_one :header
    renders_one :aside
    renders_one :scripts
  end
end
