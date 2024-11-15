# frozen_string_literal: true

module RealEstate
  module SideBar
    class NavigationComponent < ViewComponent::Base
      renders_many :links, "LinkComponent"  # Permite múltiplos links

      class LinkComponent < ViewComponent::Base
        # Espera os parâmetros: name, href e icon (nome do partial do ícone)
        def initialize(name:, href:, icon:)
          @name = name
          @href = href
          @icon = icon
        end

        def call
          content_tag(:a, href: @href, class: "nav-link") do
            concat(render_icon) # Renderiza o ícone
            concat(@name)       # Adiciona o nome do link
          end
        end

        private

        def render_icon
          # Renderiza o partial correspondente ao nome do ícone
          render(partial: "shared/icons/#{@icon}")
        end
      end
    end
  end
end
