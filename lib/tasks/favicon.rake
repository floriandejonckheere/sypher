# frozen_string_literal: true

namespace :favicon do
  ICON = Rails.root.join 'app', 'assets', 'images', 'logo.svg'
  VARIANTS = {
    'apple-touch-icon' => [57, 72, 114, 120, 144, 152, 180, 192],
    'mstile' => [144],
    'favicon' => [16, 32],
    'homescreen' => [48, 72, 96, 144, 168, 192]
  }.freeze

  desc 'Generate favicons of all sizes'
  task :generate => :environment do
    VARIANTS.each do |type, dimensions|
      dimensions.each do |dimension|
        name = "#{type}-#{dimension}x#{dimension}.png"
        puts "Generating #{name}"
        `convert -background transparent -size #{dimension}x#{dimension} #{ICON} #{Rails.root.join 'public', name}`
      end
    end
  end
end
