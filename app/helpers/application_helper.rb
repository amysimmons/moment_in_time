module ApplicationHelper
  def random_floating_image_class
    i = (1..10).to_a.sample
    "floating-image-#{i}"
  end

  def random_page_position
    top = rand(100..1000)
    left = rand(1..1000)
    "top: #{top}px; left: #{left}px;"
  end
end
