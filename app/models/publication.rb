# frozen_string_literal: true

class Publication < ActiveRecord::Base
  def language=(*)
    value = DetectLanguage.simple_detect(title.split.take(2).join(' ')) || 'en'
    super(value)
  end
end
