# frozen_string_literal: true

module Overview
  class OverviewComponent < ViewComponent::Base
    renders_one :overview_title
    renders_one :overview_description

    def initialize(title:, variant: nil, html_options: {})
      @title = title
      @variant = variant
      @html_options = html_options
    end

    attr_accessor :title, :description, :variant, :html_options
  end
end
