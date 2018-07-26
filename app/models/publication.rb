# frozen_string_literal: true

class Publication < ActiveRecord::Base
  def language=(*)
    super(CLD.detect_language(title)[:name].titleize)
  end
end
